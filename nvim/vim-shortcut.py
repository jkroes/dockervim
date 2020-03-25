import re
from collections.abc import Sequence
import os

def cmp_list_nums(x, y):
    if len(y) > len(x):
        if y[:len(x)] == x:
            return x
    else:
        return y


def split_off_tag(line):
    x = re.search(r'^\|.*?\|', line)
    if x:
        tag = x[0]
        nontag = line.replace(tag, '').strip()
        return tag, nontag
    else:
        return line


def split_off_desc(splits):
    blocks = []
    prev_delete = False  # Initialize
    for s in splits:
        # Lines that were split into tag and nontag
        if isinstance(s, Sequence) and not isinstance(s, str):
            _, nontag = s
            if '\t' in nontag:  # Cmd and desc on same line
                cmd, desc = nontag.split('\t', 1)
                cmd, desc = cmd.strip(), desc.strip()
            else:  # Description starts on different line
                cmd, desc = nontag.strip(), ''
            blocks.append([cmd, desc])
            prev_delete = False
        else:  # Lines that started without a tag
            if 3*'\t' not in s:  # Bindings without tags are typically only
                # 2*'\t' deep while hanging text is '4*\t' deep
                print('Deleted: ', s)
                prev_delete = True
            else:
                if prev_delete:  # Hanging portion of desc for binding-without-tag
                    print('Deleted: ', s)
                else:  # Hanging portion of desc for binding-with-tag, stripping
                    # whitespace if desc was set to '' earlier
                    blocks[-1][1] = (blocks[-1][1] + ' ' + s.strip()).strip()
    print('\n')
    return blocks


# Extract tags to prefix shortcut descriptions ################################
win_fn = r"C:\Users\jkroes\Documents\index.txt"
mac_fn = '/usr/local/Cellar/vim/8.1.1750/share/vim/vim81/doc/index.txt'
with open(mac_fn) as f:
    raw = f.read()

# Extract sections
# > min(len(eqs) for eqs in re.findall('={3,}', raw))
# 78
_, *sections = re.split(r'\n*={78}\n*', raw)

# Extract (sub)section list numbering
list_nums = [re.search(r'[\d.]*\d', s)[0] for s in sections]
split_nums = [ln.split('.') for ln in list_nums]

# Extract order of tag of parent section (e.g. 2) for each (
# sub)section (2.2). Top sections are considered their own parent in the
# results.
parent_of_sn = []
for i, sn in enumerate(split_nums):
    if i > 0:
        parent = cmp_list_nums(parent_of_sn[i-1], sn)
    else:
        parent = sn
    parent_of_sn.append(parent)
parent_idx = [split_nums.index(p) for p in parent_of_sn]

# Extract tags and combine parent-section tags with subsection tags
tags = [re.search(r'\*(.*?)\*', s)[1] for s in sections]
short_tags = [t.replace('-index', '') for t in tags]
parent_tags = [short_tags[i] for i in parent_idx]
final_tags = [
    parent_tags[i] + '-' + st if st != parent_tags[i] else st for i, st in
    enumerate(short_tags)
]

# Process shortcuts in each section ###########################################
# > min(len(re.findall('-{2,}', s)[0]) for s in sections)
# 71
shortcuts = [re.split(r'\n*-{71,}\n*', s)[1] for s in sections]
# Split section strings into list of section lines
sc_split = [sc.split('\n') for sc in shortcuts]
# Separate tag from rest of line
sc_split_tags = [[split_off_tag(line) for line in sc] for sc in sc_split]
# Separate rest of line into binding and description
sc_split_all = [split_off_desc(sc) for sc in sc_split_tags]

# TODO: Keep numbers and add explanation to bottom of shortcuts popup
#  Refactor later steps if they rely on numbers being removed
# Remove 'note' column values from start of section-2.* descriptions
sc_no_notes = [
    [[sc[0], re.sub('^\d\s*', '', sc[1])] for sc
     in sc_sect] for sc_sect in sc_split_all
]

# Following line from above assumes that cmd and desc on same line are
# separated by \t and not a space:
# > if '\t' in nontag:  # Cmd and desc on same line
# Get lengths of bindings to find criteria for which bindings to fix:
# > [set(len(sc[0]) for sc_sect in sc_no_notes for sc in sc_sect)]
# Manual fixes for lines that fail this criterion:
for sc_sect in sc_no_notes:
    for sc in sc_sect:
        if len(sc[0]) > 28:  # Last length with fully proper bindings
            if not sc[0].endswith('}'):  # Exclude long but proper bindings
                binding = re.search('.*?[\]}]', sc[0])[0]
                partial_desc = sc[0].replace(binding, '')
                sc[0], sc[1] = binding, partial_desc + ' ' + sc[1].strip()

# Replace '"', which probably means "same as above" with full description
for i, sc_sect in enumerate(sc_no_notes):
    for j, sc in enumerate(sc_sect):
        if sc[1] != '"':
            continue
        else:
            # print(i, j, sc)
            if 'quote_desc' not in globals():
                quote_desc = sc_no_notes[i][j - 1][1]
        sc[1] = quote_desc
# Check that changes were made
# sc_no_notes[1][61]

# Replace 'CTRL' w/ 'C' for consistency (some lines already cite 'C-')
for i, sc_sect in enumerate(sc_no_notes):
    for j, sc in enumerate(sc_sect):
        if 'CTRL' in sc[0] or 'CTRL' in sc[1]:
            sc[0] = sc[0].replace('CTRL', 'C')
            sc[1] = sc[1].replace('CTRL', 'C')

# Add section tag to shortcuts' descriptions and flatten sections
sc_all = [
    [sc[0], f'({t}) {sc[1]}']
    for t, sc_sect in zip(final_tags, sc_no_notes) for sc in sc_sect
]

# Construct commands for .vimrc
sc_vimrc = [f'Shortcut! {sc[0]}\t\t{sc[1]}\n' for sc in sc_all]

# Need to copy winfn2 in wsl to path '~/.vim/base_shortcuts.vim
winfn2 = r'C:\Users\jkroes\PycharmProjects\vim-shortcuts\base_shortcuts.vim'
macfn2 = '/Users/justinkroes/.vim/base_shortcuts.vim'
with open(macfn2, 'w') as f:
    for sc in sc_vimrc:
        f.write(sc)

# Resolve 'same as' references in descriptions
# bindings = list(list(zip(*sc_all))[0])
# bindings_simple = [
#     b.replace('[', '').replace(']', '') if b.startswith(':') else b
#     for b in bindings
# ]
#
# for sc in sc_all:
#     if 'same as' in sc[1]:
#         # Commands surrounded in quotes. May be followed by comma, space or
#         # nothing
#         search = re.search('(.*)(".*")(.*)', sc[1])
#         if search:
#             groups = search.groups()
#             same_binding = groups[1].strip('"')
#         # Commands not surrounded by quotes. May be followed by comma or
#         # nothing.
#         else:
#             search = re.search('(.*same as )([^,]*)([,].*)?', sc[1])
#             groups = search.groups()  # search2 should never be None
#             same_binding = groups[1]
#         try:
#             idx = bindings_simple.index(groups[1].strip('"'))
#             # print(bindings_simple[idx])
#         except:
#             print('Error: ')
#             print(groups[1].strip('"'))

###############################################################################
# TODO: Replace all "Same as ..." desc with referenced desc and possibly all
#  'like' desc
# TODO: How to make these respond to modes. See section descriptions


