Shortcut! C-@		(insert) insert previously inserted text and stop insert
Shortcut! C-A		(insert) insert previously inserted text
Shortcut! C-C		(insert) quit insert mode, without checking for abbreviation, unless 'insertmode' set.
Shortcut! C-D		(insert) delete one shiftwidth of indent in the current line
Shortcut! C-E		(insert) insert the character which is below the cursor
Shortcut! C-G C-J		(insert) line down, to column where inserting started
Shortcut! C-G j		(insert) line down, to column where inserting started
Shortcut! C-G <Down>		(insert) line down, to column where inserting started
Shortcut! C-G C-K		(insert) line up, to column where inserting started
Shortcut! C-G k		(insert) line up, to column where inserting started
Shortcut! C-G <Up>		(insert) line up, to column where inserting started
Shortcut! C-G u		(insert) start new undoable edit
Shortcut! C-G U		(insert) don't break undo with next cursor movement
Shortcut! <BS>		(insert) delete character before the cursor
Shortcut! {char1}<BS>{char2}		(insert) enter digraph (only when 'digraph' option set)
Shortcut! C-H		(insert) same as <BS>
Shortcut! <Tab>		(insert) insert a <Tab> character
Shortcut! C-I		(insert) same as <Tab>
Shortcut! <NL>		(insert) same as <CR>
Shortcut! C-J		(insert) same as <CR>
Shortcut! C-K {char1} {char2}		(insert) enter digraph
Shortcut! C-L		(insert) when 'insertmode' set: Leave Insert mode
Shortcut! <CR>		(insert) begin new line
Shortcut! C-M		(insert) same as <CR>
Shortcut! C-N		(insert) find next match for keyword in front of the cursor
Shortcut! C-O		(insert) execute a single command and return to insert mode
Shortcut! C-P		(insert) find previous match for keyword in front of the cursor
Shortcut! C-Q		(insert) same as C-V, unless used for terminal control flow
Shortcut! C-R {0-9a-z"%#*:=}		(insert) insert the contents of a register
Shortcut! C-R C-R {0-9a-z"%#*:=}		(insert) insert the contents of a register literally
Shortcut! C-R C-O {0-9a-z"%#*:=}		(insert) insert the contents of a register literally and don't auto-indent
Shortcut! C-R C-P {0-9a-z"%#*:=}		(insert) insert the contents of a register literally and fix indent.
Shortcut! C-T		(insert) insert one shiftwidth of indent in current line
Shortcut! C-U		(insert) delete all entered characters in the current line
Shortcut! C-V {char}		(insert) insert next non-digit literally
Shortcut! C-V {number}		(insert)  insert three digit decimal number as a single byte.
Shortcut! C-W		(insert) delete word before the cursor
Shortcut! C-X {mode}		(insert) enter C-X sub mode, see |i_C-X_index|
Shortcut! C-Y		(insert) insert the character which is above the cursor
Shortcut! C-Z		(insert) when 'insertmode' set: suspend Vim
Shortcut! <Esc>		(insert) end insert mode (unless 'insertmode' set)
Shortcut! C-[		(insert) same as <Esc>
Shortcut! C-\ C-N		(insert) go to Normal mode
Shortcut! C-\ C-G		(insert) go to mode specified with 'insertmode'
Shortcut! C-]		(insert) trigger abbreviation
Shortcut! C-^		(insert) toggle use of |:lmap| mappings
Shortcut! C-_		(insert) When 'allowrevins' set: change language (Hebrew, Farsi) {only when compiled with the |+rightleft| feature}
Shortcut! 0 C-D		(insert) delete all indent in the current line
Shortcut! ^ C-D		(insert) delete all indent in the current line, restore it in the next line
Shortcut! <Del>		(insert) delete character under the cursor
Shortcut! <Left>		(insert) cursor one character left
Shortcut! <S-Left>		(insert) cursor one word left
Shortcut! <C-Left>		(insert) cursor one word left
Shortcut! <Right>		(insert) cursor one character right
Shortcut! <S-Right>		(insert) cursor one word right
Shortcut! <C-Right>		(insert) cursor one word right
Shortcut! <Up>		(insert) cursor one line up
Shortcut! <S-Up>		(insert) same as <PageUp>
Shortcut! <Down>		(insert) cursor one line down
Shortcut! <S-Down>		(insert) same as <PageDown>
Shortcut! <Home>		(insert) cursor to start of line
Shortcut! <C-Home>		(insert) cursor to start of file
Shortcut! <End>		(insert) cursor past end of line
Shortcut! <C-End>		(insert) cursor past end of file
Shortcut! <PageUp>		(insert) one screenful backward
Shortcut! <PageDown>		(insert) one screenful forward
Shortcut! <F1>		(insert) same as <Help>
Shortcut! <Help>		(insert) stop insert mode and display help window
Shortcut! <Insert>		(insert) toggle Insert/Replace mode
Shortcut! <LeftMouse>		(insert) cursor at mouse click
Shortcut! <ScrollWheelDown>		(insert) move window three lines down
Shortcut! <S-ScrollWheelDown>		(insert) move window one page down
Shortcut! <ScrollWheelUp>		(insert) move window three lines up
Shortcut! <S-ScrollWheelUp>		(insert) move window one page up
Shortcut! <ScrollWheelLeft>		(insert) move window six columns left
Shortcut! <S-ScrollWheelLeft>		(insert) move window one page left
Shortcut! <ScrollWheelRight>		(insert) move window six columns right
Shortcut! <S-ScrollWheelRight>		(insert) move window one page right
Shortcut! C-X C-D		(insert) complete defined identifiers
Shortcut! C-X C-E		(insert) scroll up
Shortcut! C-X C-F		(insert) complete file names
Shortcut! C-X C-I		(insert) complete identifiers
Shortcut! C-X C-K		(insert) complete identifiers from dictionary
Shortcut! C-X C-L		(insert) complete whole lines
Shortcut! C-X C-N		(insert) next completion
Shortcut! C-X C-O		(insert) omni completion
Shortcut! C-X C-P		(insert) previous completion
Shortcut! C-X C-S		(insert) spelling suggestions
Shortcut! C-X C-T		(insert) complete identifiers from thesaurus
Shortcut! C-X C-Y		(insert) scroll down
Shortcut! C-X C-U		(insert) complete with 'completefunc'
Shortcut! C-X C-V		(insert) complete like in : command line
Shortcut! C-X C-]		(insert) complete tags
Shortcut! C-X s		(insert) spelling suggestions
Shortcut! C-E		(insert) stop completion and go back to original text
Shortcut! C-Y		(insert) accept selected match and stop completion
Shortcut! C-A		(normal) add N to number at/after cursor
Shortcut! C-B		(normal) scroll N screens Backwards
Shortcut! C-C		(normal) interrupt current (search) command
Shortcut! C-D		(normal) scroll Down N lines (default: half a screen)
Shortcut! C-E		(normal) scroll N lines upwards (N lines Extra)
Shortcut! C-F		(normal) scroll N screens Forward
Shortcut! C-G		(normal) display current file name and position
Shortcut! <BS>		(normal) same as "h"
Shortcut! C-H		(normal) same as "h"
Shortcut! <Tab>		(normal) go to N newer entry in jump list
Shortcut! C-I		(normal) same as <Tab>
Shortcut! <NL>		(normal) same as "j"
Shortcut! C-J		(normal) same as "j"
Shortcut! C-L		(normal) redraw screen
Shortcut! <CR>		(normal) cursor to the first CHAR N lines lower
Shortcut! C-M		(normal) same as <CR>
Shortcut! C-N		(normal) same as "j"
Shortcut! C-O		(normal) go to N older entry in jump list
Shortcut! C-P		(normal) same as "k"
Shortcut! C-R		(normal) redo changes which were undone with 'u'
Shortcut! C-T		(normal) jump to N older Tag in tag list
Shortcut! C-U		(normal) scroll N lines Upwards (default: half a screen)
Shortcut! C-V		(normal) start blockwise Visual mode
Shortcut! C-W {char}		(normal) window commands, see
Shortcut! C-X		(normal) subtract N from number at/after cursor
Shortcut! C-Y		(normal) scroll N lines downwards
Shortcut! C-Z		(normal) suspend program (or start new shell)
Shortcut! C-\ C-N		(normal) go to Normal mode (no-op)
Shortcut! C-\ C-G		(normal) go to mode specified with 'insertmode'
Shortcut! C-]		(normal) :ta to ident under cursor
Shortcut! C-^		(normal) edit Nth alternate file (equivalent to ":e #N")
Shortcut! <Space>		(normal) same as "l"
Shortcut! !{motion}{filter}		(normal) filter Nmove text through the {filter} command
Shortcut! !!{filter}		(normal) filter N lines through the {filter} command
Shortcut! "{a-zA-Z0-9.%#:-"}		(normal)   use register {a-zA-Z0-9.%#:-"} for next delete, yank or put (uppercase to append) ({.%#:} only work with put)
Shortcut! #		(normal) search backward for the Nth occurrence of the ident under the cursor
Shortcut! $		(normal) cursor to the end of Nth next line
Shortcut! %		(normal) find the next (curly/square) bracket on this line and go to its match, or go to matching comment bracket, or go to matching preprocessor directive.
Shortcut! {count}%		(normal) go to N percentage in the file
Shortcut! &		(normal) repeat last :s
Shortcut! '{a-zA-Z0-9}		(normal) cursor to the first CHAR on the line with mark {a-zA-Z0-9}
Shortcut! ''		(normal) cursor to the first CHAR of the line where the cursor was before the latest jump.
Shortcut! '(		(normal) cursor to the first CHAR on the line of the start of the current sentence
Shortcut! ')		(normal) cursor to the first CHAR on the line of the end of the current sentence
Shortcut! '<		(normal) cursor to the first CHAR of the line where highlighted area starts/started in the current buffer.
Shortcut! '>		(normal) cursor to the first CHAR of the line where highlighted area ends/ended in the current buffer.
Shortcut! '[		(normal) cursor to the first CHAR on the line of the start of last operated text or start of put text
Shortcut! ']		(normal) cursor to the first CHAR on the line of the end of last operated text or end of put text
Shortcut! '{		(normal) cursor to the first CHAR on the line of the start of the current paragraph
Shortcut! '}		(normal) cursor to the first CHAR on the line of the end of the current paragraph
Shortcut! (		(normal) cursor N sentences backward
Shortcut! )		(normal) cursor N sentences forward
Shortcut! *		(normal) search forward for the Nth occurrence of the ident under the cursor
Shortcut! +		(normal) same as <CR>
Shortcut! ,		(normal) repeat latest f, t, F or T in opposite direction N times
Shortcut! -		(normal) cursor to the first CHAR N lines higher
Shortcut! .		(normal) repeat last change with count replaced with N
Shortcut! /{pattern}<CR>		(normal) search forward for the Nth occurrence of {pattern}
Shortcut! /<CR>		(normal) search forward for {pattern} of last search
Shortcut! 0		(normal) cursor to the first char of the line
Shortcut! 1		(normal) prepend to command to give a count
Shortcut! 2		(normal) prepend to command to give a count
Shortcut! 3		(normal) prepend to command to give a count
Shortcut! 4		(normal) prepend to command to give a count
Shortcut! 5		(normal) prepend to command to give a count
Shortcut! 6		(normal) prepend to command to give a count
Shortcut! 7		(normal) prepend to command to give a count
Shortcut! 8		(normal) prepend to command to give a count
Shortcut! 9		(normal) prepend to command to give a count
Shortcut! :		(normal) start entering an Ex command
Shortcut! {count}:		(normal) start entering an Ex command with range from current line to N-1 lines down
Shortcut! ;		(normal) repeat latest f, t, F or T N times
Shortcut! <{motion}		(normal) shift Nmove lines one 'shiftwidth' leftwards
Shortcut! <<		(normal) shift N lines one 'shiftwidth' leftwards
Shortcut! ={motion}		(normal) filter Nmove lines through "indent"
Shortcut! ==		(normal) filter N lines through "indent"
Shortcut! >{motion}		(normal) shift Nmove lines one 'shiftwidth' rightwards
Shortcut! >>		(normal) shift N lines one 'shiftwidth' rightwards
Shortcut! ?{pattern}<CR>		(normal) search backward for the Nth previous occurrence of {pattern}
Shortcut! ?<CR>		(normal) search backward for {pattern} of last search
Shortcut! @{a-z}		(normal) execute the contents of register {a-z} N times
Shortcut! @:		(normal) repeat the previous ":" command N times
Shortcut! @@		(normal) repeat the previous @{a-z} N times
Shortcut! A		(normal) append text after the end of the line N times
Shortcut! B		(normal) cursor N WORDS backward
Shortcut! ["x]C		(normal) change from the cursor position to the end of the line, and N-1 more lines [into register x]; synonym for "c$"
Shortcut! ["x]D		(normal) delete the characters under the cursor until the end of the line and N-1 more lines [into register x]; synonym for "d$"
Shortcut! E		(normal) cursor forward to the end of WORD N
Shortcut! F{char}		(normal) cursor to the Nth occurrence of {char} to the left
Shortcut! G		(normal) cursor to line N, default last line
Shortcut! H		(normal) cursor to line N from top of screen
Shortcut! I		(normal) insert text before the first CHAR on the line N times
Shortcut! J		(normal) Join N lines; default is 2
Shortcut! K		(normal) lookup Keyword under the cursor with 'keywordprg'
Shortcut! L		(normal) cursor to line N from bottom of screen
Shortcut! M		(normal) cursor to middle line of screen
Shortcut! N		(normal) repeat the latest '/' or '?' N times in opposite direction
Shortcut! O		(normal) begin a new line above the cursor and insert text, repeat N times
Shortcut! ["x]P		(normal) put the text [from register x] before the cursor N times
Shortcut! Q		(normal) switch to "Ex" mode
Shortcut! R		(normal) enter replace mode: overtype existing characters, repeat the entered text N-1 times
Shortcut! ["x]S		(normal) delete N lines [into register x] and start insert; synonym for "cc".
Shortcut! T{char}		(normal) cursor till after Nth occurrence of {char} to the left
Shortcut! U		(normal) undo all latest changes on one line
Shortcut! V		(normal) start linewise Visual mode
Shortcut! W		(normal) cursor N WORDS forward
Shortcut! ["x]X		(normal) delete N characters before the cursor [into register x]
Shortcut! ["x]Y		(normal) yank N lines [into register x]; synonym for "yy"
Shortcut! ZZ		(normal) store current file if modified, and exit
Shortcut! ZQ		(normal) exit current file always
Shortcut! [{char}		(normal) square bracket command (see  below)
Shortcut! ]{char}		(normal) square bracket command (see  below)
Shortcut! ^		(normal) cursor to the first CHAR of the line
Shortcut! _		(normal) cursor to the first CHAR N - 1 lines lower
Shortcut! `{a-zA-Z0-9}		(normal) cursor to the mark {a-zA-Z0-9}
Shortcut! `(		(normal) cursor to the start of the current sentence
Shortcut! `)		(normal) cursor to the end of the current sentence
Shortcut! `<		(normal) cursor to the start of the highlighted area
Shortcut! `>		(normal) cursor to the end of the highlighted area
Shortcut! `[		(normal) cursor to the start of last operated text or start of putted text
Shortcut! `]		(normal) cursor to the end of last operated text or end of putted text
Shortcut! ``		(normal) cursor to the position before latest jump
Shortcut! `{		(normal) cursor to the start of the current paragraph
Shortcut! `}		(normal) cursor to the end of the current paragraph
Shortcut! a		(normal) append text after the cursor N times
Shortcut! b		(normal) cursor N words backward
Shortcut! ["x]c{motion}		(normal) delete Nmove text [into register x] and start insert
Shortcut! ["x]cc		(normal) delete N lines [into register x] and start insert
Shortcut! ["x]d{motion}		(normal) delete Nmove text [into register x]
Shortcut! ["x]dd		(normal) delete N lines [into register x]
Shortcut! do		(normal) same as ":diffget"
Shortcut! dp		(normal) same as ":diffput"
Shortcut! e		(normal) cursor forward to the end of word N
Shortcut! f{char}		(normal) cursor to Nth occurrence of {char} to the right
Shortcut! g{char}		(normal) extended commands, see  below
Shortcut! h		(normal) cursor N chars to the left
Shortcut! i		(normal) insert text before the cursor N times
Shortcut! j		(normal) cursor N lines downward
Shortcut! k		(normal) cursor N lines upward
Shortcut! l		(normal) cursor N chars to the right
Shortcut! m{A-Za-z}		(normal) set mark {A-Za-z} at cursor position
Shortcut! n		(normal) repeat the latest '/' or '?' N times
Shortcut! o		(normal) begin a new line below the cursor and insert text, repeat N times
Shortcut! ["x]p		(normal) put the text [from register x] after the cursor N times
Shortcut! q{0-9a-zA-Z"}		(normal) record typed characters into named register {0-9a-zA-Z"} (uppercase to append)
Shortcut! q		(normal) (while recording) stops recording
Shortcut! q:		(normal) edit : command-line in command-line window
Shortcut! q/		(normal) edit / command-line in command-line window
Shortcut! q?		(normal) edit ? command-line in command-line window
Shortcut! r{char}		(normal) replace N chars with {char}
Shortcut! ["x]s		(normal) (substitute) delete N characters [into register x] and start insert
Shortcut! t{char}		(normal) cursor till before Nth occurrence of {char} to the right
Shortcut! u		(normal) undo changes
Shortcut! v		(normal) start characterwise Visual mode
Shortcut! w		(normal) cursor N words forward
Shortcut! ["x]x		(normal) delete N characters under and after the cursor [into register x]
Shortcut! ["x]y{motion}		(normal) yank Nmove text [into register x]
Shortcut! ["x]yy		(normal) yank N lines [into register x]
Shortcut! z{char}		(normal) commands starting with 'z', see  below
Shortcut! {		(normal) cursor N paragraphs backward
Shortcut! |		(normal) cursor to column N
Shortcut! }		(normal) cursor N paragraphs forward
Shortcut! ~		(normal) 'tildeop' off: switch case of N characters under cursor and move the cursor N characters to the right
Shortcut! ~{motion}		(normal) 'tildeop' on: switch case of Nmove text
Shortcut! <C-End>		(normal) same as "G"
Shortcut! <C-Home>		(normal) same as "gg"
Shortcut! <C-Left>		(normal) same as "b"
Shortcut! <C-LeftMouse>		(normal) ":ta" to the keyword at the mouse click
Shortcut! <C-Right>		(normal) same as "w"
Shortcut! <C-RightMouse>		(normal) same as "C-T"
Shortcut! ["x]<Del>		(normal) same as "x"
Shortcut! {count}<Del>		(normal) remove the last digit from {count}
Shortcut! <Down>		(normal) same as "j"
Shortcut! <End>		(normal) same as "$"
Shortcut! <F1>		(normal) same as <Help>
Shortcut! <Help>		(normal) open a help window
Shortcut! <Home>		(normal) same as "0"
Shortcut! <Insert>		(normal) same as "i"
Shortcut! <Left>		(normal) same as "h"
Shortcut! <LeftMouse>		(normal) move cursor to the mouse click position
Shortcut! <MiddleMouse>		(normal) same as "gP" at the mouse click position
Shortcut! <PageDown>		(normal) same as C-F
Shortcut! <PageUp>		(normal) same as C-B
Shortcut! <Right>		(normal) same as "l"
Shortcut! <RightMouse>		(normal) start Visual mode, move cursor to the mouse click position
Shortcut! <S-Down>		(normal) same as C-F
Shortcut! <S-Left>		(normal) same as "b"
Shortcut! <S-LeftMouse>		(normal) same as "*" at the mouse click position
Shortcut! <S-Right>		(normal) same as "w"
Shortcut! <S-RightMouse>		(normal) same as "#" at the mouse click position
Shortcut! <S-Up>		(normal) same as C-B
Shortcut! <Undo>		(normal) same as "u"
Shortcut! <Up>		(normal) same as "k"
Shortcut! <ScrollWheelDown>		(normal) move window three lines down
Shortcut! <S-ScrollWheelDown>		(normal) move window one page down
Shortcut! <ScrollWheelUp>		(normal) move window three lines up
Shortcut! <S-ScrollWheelUp>		(normal) move window one page up
Shortcut! <ScrollWheelLeft>		(normal) move window six columns left
Shortcut! <S-ScrollWheelLeft>		(normal) move window one page left
Shortcut! <ScrollWheelRight>		(normal) move window six columns right
Shortcut! <S-ScrollWheelRight>		(normal) move window one page right
Shortcut! a"		(normal-objects) double quoted string
Shortcut! a'		(normal-objects) single quoted string
Shortcut! a(		(normal-objects) same as ab
Shortcut! a)		(normal-objects) same as ab
Shortcut! a<		(normal-objects) "a <>" from '<' to the matching '>'
Shortcut! a>		(normal-objects) same as a<
Shortcut! aB		(normal-objects) "a Block" from "[{" to "]}" (with brackets)
Shortcut! aW		(normal-objects) "a WORD" (with white space)
Shortcut! a[		(normal-objects) "a []" from '[' to the matching ']'
Shortcut! a]		(normal-objects) same as a[
Shortcut! a`		(normal-objects) string in backticks
Shortcut! ab		(normal-objects) "a block" from "[(" to "])" (with braces)
Shortcut! ap		(normal-objects) "a paragraph" (with white space)
Shortcut! as		(normal-objects) "a sentence" (with white space)
Shortcut! at		(normal-objects) "a tag block" (with white space)
Shortcut! aw		(normal-objects) "a word" (with white space)
Shortcut! a{		(normal-objects) same as aB
Shortcut! a}		(normal-objects) same as aB
Shortcut! i"		(normal-objects) double quoted string without the quotes
Shortcut! i'		(normal-objects) single quoted string without the quotes
Shortcut! i(		(normal-objects) same as ib
Shortcut! i)		(normal-objects) same as ib
Shortcut! i<		(normal-objects) "inner <>" from '<' to the matching '>'
Shortcut! i>		(normal-objects) same as i<
Shortcut! iB		(normal-objects) "inner Block" from "[{" and "]}"
Shortcut! iW		(normal-objects) "inner WORD"
Shortcut! i[		(normal-objects) "inner []" from '[' to the matching ']'
Shortcut! i]		(normal-objects) same as i[
Shortcut! i`		(normal-objects) string in backticks without the backticks
Shortcut! ib		(normal-objects) "inner block" from "[(" to "])"
Shortcut! ip		(normal-objects) "inner paragraph"
Shortcut! is		(normal-objects) "inner sentence"
Shortcut! it		(normal-objects) "inner tag block"
Shortcut! iw		(normal-objects) "inner word"
Shortcut! i{		(normal-objects) same as iB
Shortcut! i}		(normal-objects) same as iB
Shortcut! C-W C-B		(normal-CTRL-W) same as "C-W b"
Shortcut! C-W C-C		(normal-CTRL-W) same as "C-W c"
Shortcut! C-W C-D		(normal-CTRL-W) same as "C-W d"
Shortcut! C-W C-F		(normal-CTRL-W) same as "C-W f"
Shortcut! C-W C-H		(normal-CTRL-W) same as "C-W h"
Shortcut! C-W C-I		(normal-CTRL-W) same as "C-W i"
Shortcut! C-W C-J		(normal-CTRL-W) same as "C-W j"
Shortcut! C-W C-K		(normal-CTRL-W) same as "C-W k"
Shortcut! C-W C-L		(normal-CTRL-W) same as "C-W l"
Shortcut! C-W C-N		(normal-CTRL-W) same as "C-W n"
Shortcut! C-W C-O		(normal-CTRL-W) same as "C-W o"
Shortcut! C-W C-P		(normal-CTRL-W) same as "C-W p"
Shortcut! C-W C-Q		(normal-CTRL-W) same as "C-W q"
Shortcut! C-W C-R		(normal-CTRL-W) same as "C-W r"
Shortcut! C-W C-S		(normal-CTRL-W) same as "C-W s"
Shortcut! C-W C-T		(normal-CTRL-W) same as "C-W t"
Shortcut! C-W C-V		(normal-CTRL-W) same as "C-W v"
Shortcut! C-W C-W		(normal-CTRL-W) same as "C-W w"
Shortcut! C-W C-X		(normal-CTRL-W) same as "C-W x"
Shortcut! C-W C-Z		(normal-CTRL-W) same as "C-W z"
Shortcut! C-W C-]		(normal-CTRL-W) same as "C-W ]"
Shortcut! C-W C-^		(normal-CTRL-W) same as "C-W ^"
Shortcut! C-W C-_		(normal-CTRL-W) same as "C-W _"
Shortcut! C-W +		(normal-CTRL-W) increase current window height N lines
Shortcut! C-W -		(normal-CTRL-W) decrease current window height N lines
Shortcut! C-W :		(normal-CTRL-W) same as |:|, edit a command line
Shortcut! C-W <		(normal-CTRL-W) decrease current window width N columns
Shortcut! C-W =		(normal-CTRL-W) make all windows the same height & width
Shortcut! C-W >		(normal-CTRL-W) increase current window width N columns
Shortcut! C-W H		(normal-CTRL-W) move current window to the far left
Shortcut! C-W J		(normal-CTRL-W) move current window to the very bottom
Shortcut! C-W K		(normal-CTRL-W) move current window to the very top
Shortcut! C-W L		(normal-CTRL-W) move current window to the far right
Shortcut! C-W P		(normal-CTRL-W) go to preview window
Shortcut! C-W R		(normal-CTRL-W) rotate windows upwards N times
Shortcut! C-W S		(normal-CTRL-W) same as "C-W s"
Shortcut! C-W T		(normal-CTRL-W) move current window to a new tab page
Shortcut! C-W W		(normal-CTRL-W) go to N previous window (wrap around)
Shortcut! C-W ]		(normal-CTRL-W) split window and jump to tag under cursor
Shortcut! C-W ^		(normal-CTRL-W) split current window and edit alternate file N
Shortcut! C-W _		(normal-CTRL-W) set current window height to N (default: very high)
Shortcut! C-W b		(normal-CTRL-W) go to bottom window
Shortcut! C-W c		(normal-CTRL-W) close current window (like |:close|)
Shortcut! C-W d		(normal-CTRL-W) split window and jump to definition under the cursor
Shortcut! C-W f		(normal-CTRL-W) split window and edit file name under the cursor
Shortcut! C-W F		(normal-CTRL-W) split window and edit file name under the cursor and jump to the line number following the file name.
Shortcut! C-W g C-]		(normal-CTRL-W)   split window and do |:tjump| to tag under cursor
Shortcut! C-W g ]		(normal-CTRL-W) split window and do |:tselect| for tag under cursor
Shortcut! C-W g }		(normal-CTRL-W) do a |:ptjump| to the tag under the cursor
Shortcut! C-W g f		(normal-CTRL-W) edit file name under the cursor in a new tab page
Shortcut! C-W g F		(normal-CTRL-W) edit file name under the cursor in a new tab page and jump to the line number following the file name.
Shortcut! C-W g t		(normal-CTRL-W) same as `gt`: go to next tab page
Shortcut! C-W g T		(normal-CTRL-W) same as `gT`: go to previous tab page
Shortcut! C-W h		(normal-CTRL-W) go to Nth left window (stop at first window)
Shortcut! C-W i		(normal-CTRL-W) split window and jump to declaration of identifier under the cursor
Shortcut! C-W j		(normal-CTRL-W) go N windows down (stop at last window)
Shortcut! C-W k		(normal-CTRL-W) go N windows up (stop at first window)
Shortcut! C-W l		(normal-CTRL-W) go to Nth right window (stop at last window)
Shortcut! C-W n		(normal-CTRL-W) open new window, N lines high
Shortcut! C-W o		(normal-CTRL-W) close all but current window (like |:only|)
Shortcut! C-W p		(normal-CTRL-W) go to previous (last accessed) window
Shortcut! C-W q		(normal-CTRL-W) quit current window (like |:quit|)
Shortcut! C-W r		(normal-CTRL-W) rotate windows downwards N times
Shortcut! C-W s		(normal-CTRL-W) split current window in two parts, new window N lines high
Shortcut! C-W t		(normal-CTRL-W) go to top window
Shortcut! C-W v		(normal-CTRL-W) split current window vertically, new window N columns wide
Shortcut! C-W w		(normal-CTRL-W) go to N next window (wrap around)
Shortcut! C-W x		(normal-CTRL-W) exchange current window with window N (default: next window)
Shortcut! C-W z		(normal-CTRL-W) close preview window
Shortcut! C-W |		(normal-CTRL-W) set window width to N columns
Shortcut! C-W }		(normal-CTRL-W) show tag under cursor in preview window
Shortcut! C-W <Down>		(normal-CTRL-W) same as "C-W j"
Shortcut! C-W <Up>		(normal-CTRL-W) same as "C-W k"
Shortcut! C-W <Left>		(normal-CTRL-W) same as "C-W h"
Shortcut! C-W <Right>		(normal-CTRL-W) same as "C-W l"
Shortcut! [ C-D		(normal-[) jump to first #define found in current and included files matching the word under the cursor, start searching at beginning of current file
Shortcut! [ C-I		(normal-[) jump to first line in current and included files that contains the word under the cursor, start searching at beginning of current file
Shortcut! [#		(normal-[) cursor to N previous unmatched #if, #else or #ifdef
Shortcut! ['		(normal-[) cursor to previous lowercase mark, on first non-blank
Shortcut! [(		(normal-[) cursor N times back to unmatched '('
Shortcut! [*		(normal-[) same as "[/"
Shortcut! [`		(normal-[) cursor to previous lowercase mark
Shortcut! [/		(normal-[) cursor to N previous start of a C comment
Shortcut! [D		(normal-[) list all defines found in current and included files matching the word under the cursor, start searching at beginning of current file
Shortcut! [I		(normal-[) list all lines found in current and included files that contain the word under the cursor, start searching at beginning of current file
Shortcut! [P		(normal-[) same as "[p"
Shortcut! [[		(normal-[) cursor N sections backward
Shortcut! []		(normal-[) cursor N SECTIONS backward
Shortcut! [c		(normal-[) cursor N times backwards to start of change
Shortcut! [d		(normal-[) show first #define found in current and included files matching the word under the cursor, start searching at beginning of current file
Shortcut! [f		(normal-[) same as "gf"
Shortcut! [i		(normal-[) show first line found in current and included files that contains the word under the cursor, start searching at beginning of current file
Shortcut! [m		(normal-[) cursor N times back to start of member function
Shortcut! [p		(normal-[) like "P", but adjust indent to current line
Shortcut! [s		(normal-[) move to the previous misspelled word
Shortcut! [z		(normal-[) move to start of open fold
Shortcut! [{		(normal-[) cursor N times back to unmatched '{'
Shortcut! [<MiddleMouse>		(normal-[) same as "[p"
Shortcut! ] C-D		(normal-[) jump to first #define found in current and included files matching the word under the cursor, start searching at cursor position
Shortcut! ] C-I		(normal-[) jump to first line in current and included files that contains the word under the cursor, start searching at cursor position
Shortcut! ]#		(normal-[) cursor to N next unmatched #endif or #else
Shortcut! ]'		(normal-[) cursor to next lowercase mark, on first non-blank
Shortcut! ])		(normal-[) cursor N times forward to unmatched ')'
Shortcut! ]*		(normal-[) same as "]/"
Shortcut! ]`		(normal-[) cursor to next lowercase mark
Shortcut! ]/		(normal-[) cursor to N next end of a C comment
Shortcut! ]D		(normal-[) list all #defines found in current and included files matching the word under the cursor, start searching at cursor position
Shortcut! ]I		(normal-[) list all lines found in current and included files that contain the word under the cursor, start searching at cursor position
Shortcut! ]P		(normal-[) same as "[p"
Shortcut! ][		(normal-[) cursor N SECTIONS forward
Shortcut! ]]		(normal-[) cursor N sections forward
Shortcut! ]c		(normal-[) cursor N times forward to start of change
Shortcut! ]d		(normal-[) show first #define found in current and included files matching the word under the cursor, start searching at cursor position
Shortcut! ]f		(normal-[) same as "gf"
Shortcut! ]i		(normal-[) show first line found in current and included files that contains the word under the cursor, start searching at cursor position
Shortcut! ]m		(normal-[) cursor N times forward to end of member function
Shortcut! ]p		(normal-[) like "p", but adjust indent to current line
Shortcut! ]s		(normal-[) move to next misspelled word
Shortcut! ]z		(normal-[) move to end of open fold
Shortcut! ]}		(normal-[) cursor N times forward to unmatched '}'
Shortcut! ]<MiddleMouse>		(normal-[) same as "]p"
Shortcut! g C-A		(normal-g) only when compiled with MEM_PROFILE defined: dump a memory profile
Shortcut! g C-G		(normal-g) show information about current cursor position
Shortcut! g C-H		(normal-g) start Select block mode
Shortcut! g C-]		(normal-g) |:tjump| to the tag under the cursor
Shortcut! g#		(normal-g) like "#", but without using "\<" and "\>"
Shortcut! g$		(normal-g) when 'wrap' off go to rightmost character of the current line that is on the screen; when 'wrap' on go to the rightmost character of the current screen line
Shortcut! g&		(normal-g) repeat last ":s" on all lines
Shortcut! g'{mark}		(normal-g) like |'| but without changing the jumplist
Shortcut! g`{mark}		(normal-g) like |`| but without changing the jumplist
Shortcut! g*		(normal-g) like "*", but without using "\<" and "\>"
Shortcut! g+		(normal-g) go to newer text state N times
Shortcut! g,		(normal-g) go to N newer position in change list
Shortcut! g-		(normal-g) go to older text state N times
Shortcut! g0		(normal-g) when 'wrap' off go to leftmost character of the current line that is on the screen; when 'wrap' on go to the leftmost character of the current screen line
Shortcut! g8		(normal-g) print hex value of bytes used in UTF-8 character under the cursor
Shortcut! g;		(normal-g) go to N older position in change list
Shortcut! g<		(normal-g) display previous command output
Shortcut! g?		(normal-g) Rot13 encoding operator
Shortcut! g??		(normal-g) Rot13 encode current line
Shortcut! g?g?		(normal-g) Rot13 encode current line
Shortcut! gD		(normal-g) go to definition of word under the cursor in current file
Shortcut! gE		(normal-g) go backwards to the end of the previous WORD
Shortcut! gH		(normal-g) start Select line mode
Shortcut! gI		(normal-g) like "I", but always start in column 1
Shortcut! gJ		(normal-g) join lines without inserting space
Shortcut! gN		(normal-g) ,2  find the previous match with the last used search pattern and Visually select it
Shortcut! ["x]gP		(normal-g) put the text [from register x] before the cursor N times, leave the cursor after it
Shortcut! gQ		(normal-g) switch to "Ex" mode with Vim editing
Shortcut! gR		(normal-g) enter Virtual Replace mode
Shortcut! gT		(normal-g) go to the previous tab page
Shortcut! gU{motion}		(normal-g) make Nmove text uppercase
Shortcut! gV		(normal-g) don't reselect the previous Visual area when executing a mapping or menu in Select mode
Shortcut! g]		(normal-g) :tselect on the tag under the cursor
Shortcut! g^		(normal-g) when 'wrap' off go to leftmost non-white character of the current line that is on the screen; when 'wrap' on go to the leftmost non-white character of the current screen line
Shortcut! g_		(normal-g) cursor to the last CHAR N - 1 lines lower
Shortcut! ga		(normal-g) print ascii value of character under the cursor
Shortcut! gd		(normal-g) go to definition of word under the cursor in current function
Shortcut! ge		(normal-g) go backwards to the end of the previous word
Shortcut! gf		(normal-g) start editing the file whose name is under the cursor
Shortcut! gF		(normal-g) start editing the file whose name is under the cursor and jump to the line number following the filename.
Shortcut! gg		(normal-g) cursor to line N, default first line
Shortcut! gh		(normal-g) start Select mode
Shortcut! gi		(normal-g) like "i", but first move to the |'^| mark
Shortcut! gj		(normal-g) like "j", but when 'wrap' on go N screen lines down
Shortcut! gk		(normal-g) like "k", but when 'wrap' on go N screen lines up
Shortcut! gn		(normal-g) ,2  find the next match with the last used search pattern and Visually select it
Shortcut! gm		(normal-g) go to character at middle of the screenline
Shortcut! go		(normal-g) cursor to byte N in the buffer
Shortcut! ["x]gp		(normal-g) put the text [from register x] after the cursor N times, leave the cursor after it
Shortcut! gq{motion}		(normal-g) format Nmove text
Shortcut! gr{char}		(normal-g) virtual replace N chars with {char}
Shortcut! gs		(normal-g) go to sleep for N seconds (default 1)
Shortcut! gt		(normal-g) go to the next tab page
Shortcut! gu{motion}		(normal-g) make Nmove text lowercase
Shortcut! gv		(normal-g) reselect the previous Visual area
Shortcut! gw{motion}		(normal-g) format Nmove text and keep cursor
Shortcut! gx		(normal-g) execute application for file name under the cursor (only with |netrw| plugin)
Shortcut! g@{motion}		(normal-g) call 'operatorfunc'
Shortcut! g~{motion}		(normal-g) swap case for Nmove text
Shortcut! g<Down>		(normal-g) same as "gj"
Shortcut! g<End>		(normal-g) same as "g$"
Shortcut! g<Home>		(normal-g) same as "g0"
Shortcut! g<LeftMouse>		(normal-g) same as <C-LeftMouse>
Shortcut! g<RightMouse>		(normal-g) same as <C-RightMouse>
Shortcut! g<Up>		(normal-g) same as "gk"
Shortcut! z<CR>		(normal-z) redraw, cursor line to top of window, cursor on first non-blank
Shortcut! z{height}<CR>		(normal-z) redraw, make window {height} lines high
Shortcut! z+		(normal-z) cursor on line N (default line below window), otherwise like "z<CR>"
Shortcut! z-		(normal-z) redraw, cursor line at bottom of window, cursor on first non-blank
Shortcut! z.		(normal-z) redraw, cursor line to center of window, cursor on first non-blank
Shortcut! z=		(normal-z) give spelling suggestions
Shortcut! zA		(normal-z) open a closed fold or close an open fold recursively
Shortcut! zC		(normal-z) close folds recursively
Shortcut! zD		(normal-z) delete folds recursively
Shortcut! zE		(normal-z) eliminate all folds
Shortcut! zF		(normal-z) create a fold for N lines
Shortcut! zG		(normal-z) mark word as good spelled word
Shortcut! zH		(normal-z) when 'wrap' off scroll half a screenwidth to the right
Shortcut! zL		(normal-z) when 'wrap' off scroll half a screenwidth to the left
Shortcut! zM		(normal-z) set 'foldlevel' to zero
Shortcut! zN		(normal-z) set 'foldenable'
Shortcut! zO		(normal-z) open folds recursively
Shortcut! zR		(normal-z) set 'foldlevel' to the deepest fold
Shortcut! zW		(normal-z) mark word as wrong (bad) spelled word
Shortcut! zX		(normal-z) re-apply 'foldlevel'
Shortcut! z^		(normal-z) cursor on line N (default line above window), otherwise like "z-"
Shortcut! za		(normal-z) open a closed fold, close an open fold
Shortcut! zb		(normal-z) redraw, cursor line at bottom of window
Shortcut! zc		(normal-z) close a fold
Shortcut! zd		(normal-z) delete a fold
Shortcut! ze		(normal-z) when 'wrap' off scroll horizontally to position the cursor at the end (right side) of the screen
Shortcut! zf{motion}		(normal-z) create a fold for Nmove text
Shortcut! zg		(normal-z) mark word as good spelled word
Shortcut! zh		(normal-z) when 'wrap' off scroll screen N characters to the right
Shortcut! zi		(normal-z) toggle 'foldenable'
Shortcut! zj		(normal-z) move to the start of the next fold
Shortcut! zk		(normal-z) move to the end of the previous fold
Shortcut! zl		(normal-z) when 'wrap' off scroll screen N characters to the left
Shortcut! zm		(normal-z) subtract one from 'foldlevel'
Shortcut! zn		(normal-z) reset 'foldenable'
Shortcut! zo		(normal-z) open fold
Shortcut! zr		(normal-z) add one to 'foldlevel'
Shortcut! zs		(normal-z) when 'wrap' off scroll horizontally to position the cursor at the start (left side) of the screen
Shortcut! zt		(normal-z) redraw, cursor line at top of window
Shortcut! zuw		(normal-z) undo |zw|
Shortcut! zug		(normal-z) undo |zg|
Shortcut! zuW		(normal-z) undo |zW|
Shortcut! zuG		(normal-z) undo |zG|
Shortcut! zv		(normal-z) open enough folds to view the cursor line
Shortcut! zw		(normal-z) mark word as wrong (bad) spelled word
Shortcut! zx		(normal-z) re-apply 'foldlevel' and do "zv"
Shortcut! zz		(normal-z) redraw, cursor line at center of window
Shortcut! z<Left>		(normal-z) same as "zh"
Shortcut! z<Right>		(normal-z) same as "zl"
Shortcut! v		(normal-operator-pending) force operator to work characterwise
Shortcut! V		(normal-operator-pending) force operator to work linewise
Shortcut! C-V		(normal-operator-pending) force operator to work blockwise
Shortcut! C-\ C-N		(visual) stop Visual mode
Shortcut! C-\ C-G		(visual) go to mode specified with 'insertmode'
Shortcut! C-A		(visual) add N to number in highlighted text
Shortcut! C-C		(visual) stop Visual mode
Shortcut! C-G		(visual) toggle between Visual mode and Select mode
Shortcut! <BS>		(visual) Select mode: delete highlighted area
Shortcut! C-H		(visual) same as <BS>
Shortcut! C-O		(visual) switch from Select to Visual mode for one command
Shortcut! C-V		(visual) make Visual mode blockwise or stop Visual mode
Shortcut! C-X		(visual) subtract N from number in highlighted text
Shortcut! <Esc>		(visual) stop Visual mode
Shortcut! C-]		(visual) jump to highlighted tag
Shortcut! !{filter}		(visual) filter the highlighted lines through the external command {filter}
Shortcut! :		(visual) start a command-line with the highlighted lines as a range
Shortcut! <		(visual) shift the highlighted lines one 'shiftwidth' left
Shortcut! =		(visual) filter the highlighted lines through the external program given with the 'equalprg' option
Shortcut! >		(visual) shift the highlighted lines one 'shiftwidth' right
Shortcut! A		(visual) block mode: append same text in all lines, after the highlighted area
Shortcut! C		(visual) delete the highlighted lines and start insert
Shortcut! D		(visual) delete the highlighted lines
Shortcut! I		(visual) block mode: insert same text in all lines, before the highlighted area
Shortcut! J		(visual) join the highlighted lines
Shortcut! K		(visual) run 'keywordprg' on the highlighted area
Shortcut! O		(visual) Move horizontally to other corner of area.
Shortcut! R		(visual) delete the highlighted lines and start insert
Shortcut! S		(visual) delete the highlighted lines and start insert
Shortcut! U		(visual) make highlighted area uppercase
Shortcut! V		(visual) make Visual mode linewise or stop Visual mode
Shortcut! X		(visual) delete the highlighted lines
Shortcut! Y		(visual) yank the highlighted lines
Shortcut! a"		(visual) extend highlighted area with a double quoted string
Shortcut! a'		(visual) extend highlighted area with a single quoted string
Shortcut! a(		(visual) same as ab
Shortcut! a)		(visual) same as ab
Shortcut! a<		(visual) extend highlighted area with a <> block
Shortcut! a>		(visual) same as a<
Shortcut! aB		(visual) extend highlighted area with a {} block
Shortcut! aW		(visual) extend highlighted area with "a WORD"
Shortcut! a[		(visual) extend highlighted area with a [] block
Shortcut! a]		(visual) same as a[
Shortcut! a`		(visual) extend highlighted area with a backtick quoted string
Shortcut! ab		(visual) extend highlighted area with a () block
Shortcut! ap		(visual) extend highlighted area with a paragraph
Shortcut! as		(visual) extend highlighted area with a sentence
Shortcut! at		(visual) extend highlighted area with a tag block
Shortcut! aw		(visual) extend highlighted area with "a word"
Shortcut! a{		(visual) same as aB
Shortcut! a}		(visual) same as aB
Shortcut! c		(visual) delete highlighted area and start insert
Shortcut! d		(visual) delete highlighted area
Shortcut! g C-A		(visual) add N to number in highlighted text
Shortcut! g C-X		(visual) subtract N from number in highlighted text
Shortcut! gJ		(visual) join the highlighted lines without inserting spaces
Shortcut! gq		(visual) format the highlighted lines
Shortcut! gv		(visual) exchange current and previous highlighted area
Shortcut! i"		(visual) extend highlighted area with a double quoted string (without quotes)
Shortcut! i'		(visual) extend highlighted area with a single quoted string (without quotes)
Shortcut! i(		(visual) same as ib
Shortcut! i)		(visual) same as ib
Shortcut! i<		(visual) extend highlighted area with inner <> block
Shortcut! i>		(visual) same as i<
Shortcut! iB		(visual) extend highlighted area with inner {} block
Shortcut! iW		(visual) extend highlighted area with "inner WORD"
Shortcut! i[		(visual) extend highlighted area with inner [] block
Shortcut! i]		(visual) same as i[
Shortcut! i`		(visual) extend highlighted area with a backtick quoted string (without the backticks)
Shortcut! ib		(visual) extend highlighted area with inner () block
Shortcut! ip		(visual) extend highlighted area with inner paragraph
Shortcut! is		(visual) extend highlighted area with inner sentence
Shortcut! it		(visual) extend highlighted area with inner tag block
Shortcut! iw		(visual) extend highlighted area with "inner word"
Shortcut! i{		(visual) same as iB
Shortcut! i}		(visual) same as iB
Shortcut! o		(visual) move cursor to other corner of area
Shortcut! r		(visual) replace highlighted area with a character
Shortcut! s		(visual) delete highlighted area and start insert
Shortcut! u		(visual) make highlighted area lowercase
Shortcut! v		(visual) make Visual mode characterwise or stop Visual mode
Shortcut! x		(visual) delete the highlighted area
Shortcut! y		(visual) yank the highlighted area
Shortcut! ~		(visual) swap case for the highlighted area
Shortcut! C-A		(ex-edit) do completion on the pattern in front of the cursor and insert all matches
Shortcut! C-B		(ex-edit) cursor to begin of command-line
Shortcut! C-C		(ex-edit) same as <Esc>
Shortcut! C-D		(ex-edit) list completions that match the pattern in front of the cursor
Shortcut! C-E		(ex-edit) cursor to end of command-line
Shortcut! C-F		(ex-edit) default value for 'cedit': opens the command-line window; otherwise not used
Shortcut! C-G		(ex-edit) next match when 'incsearch' is active
Shortcut! <BS>		(ex-edit) delete the character in front of the cursor
Shortcut! {char1} <BS> {char2}		(ex-edit) enter digraph when 'digraph' is on
Shortcut! C-H		(ex-edit) same as <BS>
Shortcut! <Tab>		(ex-edit) if 'wildchar' is <Tab>: Do completion on the pattern in front of the cursor
Shortcut! <S-Tab>		(ex-edit) same as C-P
Shortcut! 'wildchar'		(ex-edit) Do completion on the pattern in front of the cursor (default: <Tab>)
Shortcut! C-I		(ex-edit) same as <Tab>
Shortcut! <NL>		(ex-edit) same as <CR>
Shortcut! C-J		(ex-edit) same as <CR>
Shortcut! C-K {char1} {char2}		(ex-edit) enter digraph
Shortcut! C-L		(ex-edit) do completion on the pattern in front of the cursor and insert the longest common part
Shortcut! <CR>		(ex-edit) execute entered command
Shortcut! C-M		(ex-edit) same as <CR>
Shortcut! C-N		(ex-edit) after using 'wildchar' with multiple matches: go to next match, otherwise: recall older command-line from history.
Shortcut! C-P		(ex-edit) after using 'wildchar' with multiple matches: go to previous match, otherwise: recall older command-line from history.
Shortcut! C-Q		(ex-edit) same as C-V, unless it's used for terminal control flow
Shortcut! C-R {regname}		(ex-edit) insert the contents of a register or object under the cursor as if typed
Shortcut! C-R C-R {regname}		(ex-edit) 
Shortcut! C-R C-O {regname}		(ex-edit) insert the contents of a register or object under the cursor literally
Shortcut! C-T		(ex-edit) previous match when 'incsearch' is active
Shortcut! C-U		(ex-edit) remove all characters
Shortcut! C-V		(ex-edit) insert next non-digit literally, insert three digit decimal number as a single byte.
Shortcut! C-W		(ex-edit) delete the word in front of the cursor
Shortcut! <Esc>		(ex-edit) abandon command-line without executing it
Shortcut! C-[		(ex-edit) same as <Esc>
Shortcut! C-\ C-N		(ex-edit) go to Normal mode, abandon command-line
Shortcut! C-\ C-G		(ex-edit) go to mode specified with 'insertmode', abandon command-line
Shortcut! C-\ e {expr}		(ex-edit)  replace the command line with the result of {expr}
Shortcut! C-]		(ex-edit) trigger abbreviation
Shortcut! C-^		(ex-edit) toggle use of |:lmap| mappings
Shortcut! C-_		(ex-edit) when 'allowrevins' set: change language (Hebrew, Farsi)
Shortcut! <Del>		(ex-edit) delete the character under the cursor
Shortcut! <Left>		(ex-edit) cursor left
Shortcut! <S-Left>		(ex-edit) cursor one word left
Shortcut! <C-Left>		(ex-edit) cursor one word left
Shortcut! <Right>		(ex-edit) cursor right
Shortcut! <S-Right>		(ex-edit) cursor one word right
Shortcut! <C-Right>		(ex-edit) cursor one word right
Shortcut! <Up>		(ex-edit) recall previous command-line from history that matches pattern in front of the cursor
Shortcut! <S-Up>		(ex-edit) recall previous command-line from history
Shortcut! <Down>		(ex-edit) recall next command-line from history that matches pattern in front of the cursor
Shortcut! <S-Down>		(ex-edit) recall next command-line from history
Shortcut! <Home>		(ex-edit) cursor to start of command-line
Shortcut! <End>		(ex-edit) cursor to end of command-line
Shortcut! <PageDown>		(ex-edit) same as <S-Down>
Shortcut! <PageUp>		(ex-edit) same as <S-Up>
Shortcut! <Insert>		(ex-edit) toggle insert/overstrike mode
Shortcut! <LeftMouse>		(ex-edit) cursor at mouse click
Shortcut! C-\ C-N		(terminal-job) switch to Terminal-Normal mode
Shortcut! C-W N		(terminal-job) switch to Terminal-Normal mode
Shortcut! C-W :		(terminal-job) enter an Ex command
Shortcut! C-W .		(terminal-job) type C-W in the terminal
Shortcut! C-W " {0-9a-z"%#*:=}		(terminal-job) paste register in the terminal
Shortcut! C-W C-C		(terminal-job) forcefully ends the job
Shortcut! C-W C-W		(terminal-job) move focus to the next window
Shortcut! C-W gt		(terminal-job) go to next tabpage, same as `gt`
Shortcut! C-W gT		(terminal-job) go to previous tabpage, same as `gT`
Shortcut! :!		(ex-cmd) filter lines or execute an external command
Shortcut! :!!		(ex-cmd) repeat last ":!" command
Shortcut! :#		(ex-cmd) same as ":number"
Shortcut! :&		(ex-cmd) repeat last ":substitute"
Shortcut! :*		(ex-cmd) execute contents of a register
Shortcut! :<		(ex-cmd) shift lines one 'shiftwidth' left
Shortcut! :=		(ex-cmd) print the cursor line number
Shortcut! :>		(ex-cmd) shift lines one 'shiftwidth' right
Shortcut! :@		(ex-cmd) execute contents of a register
Shortcut! :@@		(ex-cmd) repeat the previous ":@"
Shortcut! :N[ext]		(ex-cmd) go to previous file in the argument list
Shortcut! :P[rint]		(ex-cmd) print lines
Shortcut! :X		(ex-cmd) ask for encryption key
Shortcut! :a[ppend]		(ex-cmd) append text
Shortcut! :ab[breviate]		(ex-cmd) enter abbreviation
Shortcut! :abc[lear]		(ex-cmd) remove all abbreviations
Shortcut! :abo[veleft]		(ex-cmd) make split window appear left or above
Shortcut! :al[l]		(ex-cmd) open a window for each file in the argument list
Shortcut! :am[enu]		(ex-cmd) enter new menu item for all modes
Shortcut! :an[oremenu]		(ex-cmd) enter a new menu for all modes that will not be remapped
Shortcut! :ar[gs]		(ex-cmd) print the argument list
Shortcut! :arga[dd]		(ex-cmd) add items to the argument list
Shortcut! :argd[elete]		(ex-cmd) delete items from the argument list
Shortcut! :arge[dit]		(ex-cmd) add item to the argument list and edit it
Shortcut! :argdo		(ex-cmd) do a command on all items in the argument list
Shortcut! :argg[lobal]		(ex-cmd) define the global argument list
Shortcut! :argl[ocal]		(ex-cmd) define a local argument list
Shortcut! :argu[ment]		(ex-cmd) go to specific file in the argument list
Shortcut! :as[cii]		(ex-cmd) print ascii value of character under the cursor
Shortcut! :au[tocmd]		(ex-cmd) enter or show autocommands
Shortcut! :aug[roup]		(ex-cmd) select the autocommand group to use
Shortcut! :aun[menu]		(ex-cmd) remove menu for all modes
Shortcut! :b[uffer]		(ex-cmd) go to specific buffer in the buffer list
Shortcut! :bN[ext]		(ex-cmd) go to previous buffer in the buffer list
Shortcut! :ba[ll]		(ex-cmd) open a window for each buffer in the buffer list
Shortcut! :bad[d]		(ex-cmd) add buffer to the buffer list
Shortcut! :bd[elete]		(ex-cmd) remove a buffer from the buffer list
Shortcut! :be[have]		(ex-cmd) set mouse and selection behavior
Shortcut! :bel[owright]		(ex-cmd) make split window appear right or below
Shortcut! :bf[irst]		(ex-cmd) go to first buffer in the buffer list
Shortcut! :bl[ast]		(ex-cmd) go to last buffer in the buffer list
Shortcut! :bm[odified]		(ex-cmd) go to next buffer in the buffer list that has been modified
Shortcut! :bn[ext]		(ex-cmd) go to next buffer in the buffer list
Shortcut! :bo[tright]		(ex-cmd) make split window appear at bottom or far right
Shortcut! :bp[revious]		(ex-cmd) go to previous buffer in the buffer list
Shortcut! :br[ewind]		(ex-cmd) go to first buffer in the buffer list
Shortcut! :brea[k]		(ex-cmd) break out of while loop
Shortcut! :breaka[dd]		(ex-cmd) add a debugger breakpoint
Shortcut! :breakd[el]		(ex-cmd) delete a debugger breakpoint
Shortcut! :breakl[ist]		(ex-cmd) list debugger breakpoints
Shortcut! :bro[wse]		(ex-cmd) use file selection dialog
Shortcut! :bufdo		(ex-cmd) execute command in each listed buffer
Shortcut! :buffers		(ex-cmd) list all files in the buffer list
Shortcut! :bun[load]		(ex-cmd) unload a specific buffer
Shortcut! :bw[ipeout]		(ex-cmd) really delete a buffer
Shortcut! :c[hange]		(ex-cmd) replace a line or series of lines
Shortcut! :cN[ext]		(ex-cmd) go to previous error
Shortcut! :cNf[ile]		(ex-cmd) go to last error in previous file
Shortcut! :ca[bbrev]		(ex-cmd) like ":abbreviate" but for Command-line mode
Shortcut! :cabc[lear]		(ex-cmd) clear all abbreviations for Command-line mode
Shortcut! :cabo[ve]		(ex-cmd) go to error above current line
Shortcut! :cad[dbuffer]		(ex-cmd) add errors from buffer
Shortcut! :cadde[xpr]		(ex-cmd) add errors from expr
Shortcut! :caddf[ile]		(ex-cmd) add error message to current quickfix list
Shortcut! :caf[ter]		(ex-cmd) go to error after current cursor
Shortcut! :cal[l]		(ex-cmd) call a function
Shortcut! :cat[ch]		(ex-cmd) part of a :try command
Shortcut! :cbef[ore]		(ex-cmd) go to error before current cursor
Shortcut! :cbel[ow]		(ex-cmd) go to error below current line
Shortcut! :cbo[ttom]		(ex-cmd) scroll to the bottom of the quickfix window
Shortcut! :cb[uffer]		(ex-cmd) parse error messages and jump to first error
Shortcut! :cc		(ex-cmd) go to specific error
Shortcut! :ccl[ose]		(ex-cmd) close quickfix window
Shortcut! :cd		(ex-cmd) change directory
Shortcut! :cdo		(ex-cmd) execute command in each valid error list entry
Shortcut! :cfd[o]		(ex-cmd) execute command in each file in error list
Shortcut! :ce[nter]		(ex-cmd) format lines at the center
Shortcut! :cex[pr]		(ex-cmd) read errors from expr and jump to first
Shortcut! :cf[ile]		(ex-cmd) read file with error messages and jump to first
Shortcut! :cfir[st]		(ex-cmd) go to the specified error, default first one
Shortcut! :cgetb[uffer]		(ex-cmd) get errors from buffer
Shortcut! :cgete[xpr]		(ex-cmd) get errors from expr
Shortcut! :cg[etfile]		(ex-cmd) read file with error messages
Shortcut! :changes		(ex-cmd) print the change list
Shortcut! :chd[ir]		(ex-cmd) change directory
Shortcut! :che[ckpath]		(ex-cmd) list included files
Shortcut! :checkt[ime]		(ex-cmd) check timestamp of loaded buffers
Shortcut! :chi[story]		(ex-cmd) list the error lists
Shortcut! :cla[st]		(ex-cmd) go to the specified error, default last one
Shortcut! :cle[arjumps]		(ex-cmd) clear the jump list
Shortcut! :cl[ist]		(ex-cmd) list all errors
Shortcut! :clo[se]		(ex-cmd) close current window
Shortcut! :cm[ap]		(ex-cmd) like ":map" but for Command-line mode
Shortcut! :cmapc[lear]		(ex-cmd) clear all mappings for Command-line mode
Shortcut! :cme[nu]		(ex-cmd) add menu for Command-line mode
Shortcut! :cn[ext]		(ex-cmd) go to next error
Shortcut! :cnew[er]		(ex-cmd) go to newer error list
Shortcut! :cnf[ile]		(ex-cmd) go to first error in next file
Shortcut! :cno[remap]		(ex-cmd) like ":noremap" but for Command-line mode
Shortcut! :cnorea[bbrev]		(ex-cmd) like ":noreabbrev" but for Command-line mode
Shortcut! :cnoreme[nu]		(ex-cmd) like ":noremenu" but for Command-line mode
Shortcut! :co[py]		(ex-cmd) copy lines
Shortcut! :col[der]		(ex-cmd) go to older error list
Shortcut! :colo[rscheme]		(ex-cmd) load a specific color scheme
Shortcut! :com[mand]		(ex-cmd) create user-defined command
Shortcut! :comc[lear]		(ex-cmd) clear all user-defined commands
Shortcut! :comp[iler]		(ex-cmd) do settings for a specific compiler
Shortcut! :con[tinue]		(ex-cmd) go back to :while
Shortcut! :conf[irm]		(ex-cmd) prompt user when confirmation required
Shortcut! :cons[t]		(ex-cmd) create a variable as a constant
Shortcut! :cope[n]		(ex-cmd) open quickfix window
Shortcut! :cp[revious]		(ex-cmd) go to previous error
Shortcut! :cpf[ile]		(ex-cmd) go to last error in previous file
Shortcut! :cq[uit]		(ex-cmd) quit Vim with an error code
Shortcut! :cr[ewind]		(ex-cmd) go to the specified error, default first one
Shortcut! :cs[cope]		(ex-cmd) execute cscope command
Shortcut! :cst[ag]		(ex-cmd) use cscope to jump to a tag
Shortcut! :cu[nmap]		(ex-cmd) like ":unmap" but for Command-line mode
Shortcut! :cuna[bbrev]		(ex-cmd) like ":unabbrev" but for Command-line mode
Shortcut! :cunme[nu]		(ex-cmd) remove menu for Command-line mode
Shortcut! :cw[indow]		(ex-cmd) open or close quickfix window
Shortcut! :d[elete]		(ex-cmd) delete lines
Shortcut! :delm[arks]		(ex-cmd) delete marks
Shortcut! :deb[ug]		(ex-cmd) run a command in debugging mode
Shortcut! :debugg[reedy]		(ex-cmd) read debug mode commands from normal input
Shortcut! :delc[ommand]		(ex-cmd) delete user-defined command
Shortcut! :delf[unction]		(ex-cmd) delete a user function
Shortcut! :dif[fupdate]		(ex-cmd) update 'diff' buffers
Shortcut! :diffg[et]		(ex-cmd) remove differences in current buffer
Shortcut! :diffo[ff]		(ex-cmd) switch off diff mode
Shortcut! :diffp[atch]		(ex-cmd) apply a patch and show differences
Shortcut! :diffpu[t]		(ex-cmd) remove differences in other buffer
Shortcut! :diffs[plit]		(ex-cmd) show differences with another file
Shortcut! :diffthis		(ex-cmd) make current window a diff window
Shortcut! :dig[raphs]		(ex-cmd) show or enter digraphs
Shortcut! :di[splay]		(ex-cmd) display registers
Shortcut! :dj[ump]		(ex-cmd) jump to #define
Shortcut! :dl		(ex-cmd) short for |:delete| with the 'l' flag
Shortcut! :del[ete]l		(ex-cmd) short for |:delete| with the 'l' flag
Shortcut! :dli[st]		(ex-cmd) list #defines
Shortcut! :do[autocmd]		(ex-cmd) apply autocommands to current buffer
Shortcut! :doautoa[ll]		(ex-cmd) apply autocommands for all loaded buffers
Shortcut! :d[elete]p		(ex-cmd) short for |:delete| with the 'p' flag
Shortcut! :dr[op]		(ex-cmd) jump to window editing file or edit file in current window
Shortcut! :ds[earch]		(ex-cmd) list one #define
Shortcut! :dsp[lit]		(ex-cmd) split window and jump to #define
Shortcut! :e[dit]		(ex-cmd) edit a file
Shortcut! :ea[rlier]		(ex-cmd) go to older change, undo
Shortcut! :ec[ho]		(ex-cmd) echoes the result of expressions
Shortcut! :echoe[rr]		(ex-cmd) like :echo, show like an error and use history
Shortcut! :echoh[l]		(ex-cmd) set highlighting for echo commands
Shortcut! :echom[sg]		(ex-cmd) same as :echo, put message in history
Shortcut! :echon		(ex-cmd) same as :echo, but without <EOL>
Shortcut! :el[se]		(ex-cmd) part of an :if command
Shortcut! :elsei[f]		(ex-cmd) part of an :if command
Shortcut! :em[enu]		(ex-cmd) execute a menu by name
Shortcut! :en[dif]		(ex-cmd) end previous :if
Shortcut! :endfo[r]		(ex-cmd) end previous :for
Shortcut! :endf[unction]		(ex-cmd) end of a user function
Shortcut! :endt[ry]		(ex-cmd) end previous :try
Shortcut! :endw[hile]		(ex-cmd) end previous :while
Shortcut! :ene[w]		(ex-cmd) edit a new, unnamed buffer
Shortcut! :ex		(ex-cmd) same as ":edit"
Shortcut! :exe[cute]		(ex-cmd) execute result of expressions
Shortcut! :exi[t]		(ex-cmd) same as ":xit"
Shortcut! :exu[sage]		(ex-cmd) overview of Ex commands
Shortcut! :f[ile]		(ex-cmd) show or set the current file name
Shortcut! :files		(ex-cmd) list all files in the buffer list
Shortcut! :filet[ype]		(ex-cmd) switch file type detection on/off
Shortcut! :filt[er]		(ex-cmd) filter output of following command
Shortcut! :fin[d]		(ex-cmd) find file in 'path' and edit it
Shortcut! :fina[lly]		(ex-cmd) part of a :try command
Shortcut! :fini[sh]		(ex-cmd) quit sourcing a Vim script
Shortcut! :fir[st]		(ex-cmd) go to the first file in the argument list
Shortcut! :fix[del]		(ex-cmd) set key code of <Del>
Shortcut! :fo[ld]		(ex-cmd) create a fold
Shortcut! :foldc[lose]		(ex-cmd) close folds
Shortcut! :foldd[oopen]		(ex-cmd) execute command on lines not in a closed fold
Shortcut! :folddoc[losed]		(ex-cmd) execute command on lines in a closed fold
Shortcut! :foldo[pen]		(ex-cmd) open folds
Shortcut! :for		(ex-cmd) for loop
Shortcut! :fu[nction]		(ex-cmd) define a user function
Shortcut! :g[lobal]		(ex-cmd) execute commands for matching lines
Shortcut! :go[to]		(ex-cmd) go to byte in the buffer
Shortcut! :gr[ep]		(ex-cmd) run 'grepprg' and jump to first match
Shortcut! :grepa[dd]		(ex-cmd) like :grep, but append to current list
Shortcut! :gu[i]		(ex-cmd) start the GUI
Shortcut! :gv[im]		(ex-cmd) start the GUI
Shortcut! :ha[rdcopy]		(ex-cmd) send text to the printer
Shortcut! :h[elp]		(ex-cmd) open a help window
Shortcut! :helpc[lose]		(ex-cmd) close one help window
Shortcut! :helpf[ind]		(ex-cmd) dialog to open a help window
Shortcut! :helpg[rep]		(ex-cmd) like ":grep" but searches help files
Shortcut! :helpt[ags]		(ex-cmd) generate help tags for a directory
Shortcut! :hi[ghlight]		(ex-cmd) specify highlighting methods
Shortcut! :hid[e]		(ex-cmd) hide current buffer for a command
Shortcut! :his[tory]		(ex-cmd) print a history list
Shortcut! :i[nsert]		(ex-cmd) insert text
Shortcut! :ia[bbrev]		(ex-cmd) like ":abbrev" but for Insert mode
Shortcut! :iabc[lear]		(ex-cmd) like ":abclear" but for Insert mode
Shortcut! :if		(ex-cmd) execute commands when condition met
Shortcut! :ij[ump]		(ex-cmd) jump to definition of identifier
Shortcut! :il[ist]		(ex-cmd) list lines where identifier matches
Shortcut! :im[ap]		(ex-cmd) like ":map" but for Insert mode
Shortcut! :imapc[lear]		(ex-cmd) like ":mapclear" but for Insert mode
Shortcut! :ime[nu]		(ex-cmd) add menu for Insert mode
Shortcut! :ino[remap]		(ex-cmd) like ":noremap" but for Insert mode
Shortcut! :inorea[bbrev]		(ex-cmd) like ":noreabbrev" but for Insert mode
Shortcut! :inoreme[nu]		(ex-cmd) like ":noremenu" but for Insert mode
Shortcut! :int[ro]		(ex-cmd) print the introductory message
Shortcut! :is[earch]		(ex-cmd) list one line where identifier matches
Shortcut! :isp[lit]		(ex-cmd) split window and jump to definition of identifier
Shortcut! :iu[nmap]		(ex-cmd) like ":unmap" but for Insert mode
Shortcut! :iuna[bbrev]		(ex-cmd) like ":unabbrev" but for Insert mode
Shortcut! :iunme[nu]		(ex-cmd) remove menu for Insert mode
Shortcut! :j[oin]		(ex-cmd) join lines
Shortcut! :ju[mps]		(ex-cmd) print the jump list
Shortcut! :k		(ex-cmd) set a mark
Shortcut! :keepa[lt]		(ex-cmd) following command keeps the alternate file
Shortcut! :kee[pmarks]		(ex-cmd) following command keeps marks where they are
Shortcut! :keepj[umps]		(ex-cmd) following command keeps jumplist and marks
Shortcut! :keepp[atterns]		(ex-cmd) following command keeps search pattern history
Shortcut! :lN[ext]		(ex-cmd) go to previous entry in location list
Shortcut! :lNf[ile]		(ex-cmd) go to last entry in previous file
Shortcut! :l[ist]		(ex-cmd) print lines
Shortcut! :lab[ove]		(ex-cmd) go to location above current line
Shortcut! :lad[dexpr]		(ex-cmd) add locations from expr
Shortcut! :laddb[uffer]		(ex-cmd) add locations from buffer
Shortcut! :laddf[ile]		(ex-cmd) add locations to current location list
Shortcut! :laf[ter]		(ex-cmd) go to location after current cursor
Shortcut! :la[st]		(ex-cmd) go to the last file in the argument list
Shortcut! :lan[guage]		(ex-cmd) set the language (locale)
Shortcut! :lat[er]		(ex-cmd) go to newer change, redo
Shortcut! :lbef[ore]		(ex-cmd) go to location before current cursor
Shortcut! :lbel[ow]		(ex-cmd) go to location below current line
Shortcut! :lbo[ttom]		(ex-cmd) scroll to the bottom of the location window
Shortcut! :lb[uffer]		(ex-cmd) parse locations and jump to first location
Shortcut! :lc[d]		(ex-cmd) change directory locally
Shortcut! :lch[dir]		(ex-cmd) change directory locally
Shortcut! :lcl[ose]		(ex-cmd) close location window
Shortcut! :lcs[cope]		(ex-cmd) like ":cscope" but uses location list
Shortcut! :ld[o]		(ex-cmd) execute command in valid location list entries
Shortcut! :lfd[o]		(ex-cmd) execute command in each file in location list
Shortcut! :le[ft]		(ex-cmd) left align lines
Shortcut! :lefta[bove]		(ex-cmd) make split window appear left or above
Shortcut! :let		(ex-cmd) assign a value to a variable or option
Shortcut! :lex[pr]		(ex-cmd) read locations from expr and jump to first
Shortcut! :lf[ile]		(ex-cmd) read file with locations and jump to first
Shortcut! :lfir[st]		(ex-cmd) go to the specified location, default first one
Shortcut! :lgetb[uffer]		(ex-cmd) get locations from buffer
Shortcut! :lgete[xpr]		(ex-cmd) get locations from expr
Shortcut! :lg[etfile]		(ex-cmd) read file with locations
Shortcut! :lgr[ep]		(ex-cmd) run 'grepprg' and jump to first match
Shortcut! :lgrepa[dd]		(ex-cmd) like :grep, but append to current list
Shortcut! :lh[elpgrep]		(ex-cmd) like ":helpgrep" but uses location list
Shortcut! :lhi[story]		(ex-cmd) list the location lists
Shortcut! :ll		(ex-cmd) go to specific location
Shortcut! :lla[st]		(ex-cmd) go to the specified location, default last one
Shortcut! :lli[st]		(ex-cmd) list all locations
Shortcut! :lmak[e]		(ex-cmd) execute external command 'makeprg' and parse error messages
Shortcut! :lm[ap]		(ex-cmd) like ":map!" but includes Lang-Arg mode
Shortcut! :lmapc[lear]		(ex-cmd) like ":mapclear!" but includes Lang-Arg mode
Shortcut! :lne[xt]		(ex-cmd) go to next location
Shortcut! :lnew[er]		(ex-cmd) go to newer location list
Shortcut! :lnf[ile]		(ex-cmd) go to first location in next file
Shortcut! :ln[oremap]		(ex-cmd) like ":noremap!" but includes Lang-Arg mode
Shortcut! :loadk[eymap]		(ex-cmd) load the following keymaps until EOF
Shortcut! :lo[adview]		(ex-cmd) load view for current window from a file
Shortcut! :loc[kmarks]		(ex-cmd) following command keeps marks where they are
Shortcut! :lockv[ar]		(ex-cmd) lock variables
Shortcut! :lol[der]		(ex-cmd) go to older location list
Shortcut! :lope[n]		(ex-cmd) open location window
Shortcut! :lp[revious]		(ex-cmd) go to previous location
Shortcut! :lpf[ile]		(ex-cmd) go to last location in previous file
Shortcut! :lr[ewind]		(ex-cmd) go to the specified location, default first one
Shortcut! :ls		(ex-cmd) list all buffers
Shortcut! :lt[ag]		(ex-cmd) jump to tag and add matching tags to the location list
Shortcut! :lu[nmap]		(ex-cmd) like ":unmap!" but includes Lang-Arg mode
Shortcut! :lua		(ex-cmd) execute |Lua| command
Shortcut! :luad[o]		(ex-cmd) execute Lua command for each line
Shortcut! :luaf[ile]		(ex-cmd) execute |Lua| script file
Shortcut! :lv[imgrep]		(ex-cmd) search for pattern in files
Shortcut! :lvimgrepa[dd]		(ex-cmd) like :vimgrep, but append to current list
Shortcut! :lw[indow]		(ex-cmd) open or close location window
Shortcut! :m[ove]		(ex-cmd) move lines
Shortcut! :ma[rk]		(ex-cmd) set a mark
Shortcut! :mak[e]		(ex-cmd) execute external command 'makeprg' and parse error messages
Shortcut! :map		(ex-cmd) show or enter a mapping
Shortcut! :mapc[lear]		(ex-cmd) clear all mappings for Normal and Visual mode
Shortcut! :marks		(ex-cmd) list all marks
Shortcut! :mat[ch]		(ex-cmd) define a match to highlight
Shortcut! :me[nu]		(ex-cmd) enter a new menu item
Shortcut! :menut[ranslate]		(ex-cmd)  add a menu translation item 
Shortcut! :mes[sages]		(ex-cmd) view previously displayed messages
Shortcut! :mk[exrc]		(ex-cmd) write current mappings and settings to a file
Shortcut! :mks[ession]		(ex-cmd) write session info to a file
Shortcut! :mksp[ell]		(ex-cmd) produce .spl spell file
Shortcut! :mkv[imrc]		(ex-cmd) write current mappings and settings to a file
Shortcut! :mkvie[w]		(ex-cmd) write view of current window to a file
Shortcut! :mod[e]		(ex-cmd) show or change the screen mode
Shortcut! :mz[scheme]		(ex-cmd) execute MzScheme command
Shortcut! :mzf[ile]		(ex-cmd) execute MzScheme script file
Shortcut! :nbc[lose]		(ex-cmd) close the current Netbeans session
Shortcut! :nb[key]		(ex-cmd) pass a key to Netbeans
Shortcut! :nbs[art]		(ex-cmd) start a new Netbeans session
Shortcut! :n[ext]		(ex-cmd) go to next file in the argument list
Shortcut! :new		(ex-cmd) create a new empty window
Shortcut! :nm[ap]		(ex-cmd) like ":map" but for Normal mode
Shortcut! :nmapc[lear]		(ex-cmd) clear all mappings for Normal mode
Shortcut! :nme[nu]		(ex-cmd) add menu for Normal mode
Shortcut! :nn[oremap]		(ex-cmd) like ":noremap" but for Normal mode
Shortcut! :nnoreme[nu]		(ex-cmd) like ":noremenu" but for Normal mode
Shortcut! :noa[utocmd]		(ex-cmd) following commands don't trigger autocommands
Shortcut! :no[remap]		(ex-cmd) enter a mapping that will not be remapped
Shortcut! :noh[lsearch]		(ex-cmd) suspend 'hlsearch' highlighting
Shortcut! :norea[bbrev]		(ex-cmd) enter an abbreviation that will not be remapped
Shortcut! :noreme[nu]		(ex-cmd) enter a menu that will not be remapped
Shortcut! :norm[al]		(ex-cmd) execute Normal mode commands
Shortcut! :nos[wapfile]		(ex-cmd) following commands don't create a swap file
Shortcut! :nu[mber]		(ex-cmd) print lines with line number
Shortcut! :nun[map]		(ex-cmd) like ":unmap" but for Normal mode
Shortcut! :nunme[nu]		(ex-cmd) remove menu for Normal mode
Shortcut! :ol[dfiles]		(ex-cmd) list files that have marks in the viminfo file
Shortcut! :o[pen]		(ex-cmd) start open mode (not implemented)
Shortcut! :om[ap]		(ex-cmd) like ":map" but for Operator-pending mode
Shortcut! :omapc[lear]		(ex-cmd) remove all mappings for Operator-pending mode
Shortcut! :ome[nu]		(ex-cmd) add menu for Operator-pending mode
Shortcut! :on[ly]		(ex-cmd) close all windows except the current one
Shortcut! :ono[remap]		(ex-cmd) like ":noremap" but for Operator-pending mode
Shortcut! :onoreme[nu]		(ex-cmd) like ":noremenu" but for Operator-pending mode
Shortcut! :opt[ions]		(ex-cmd) open the options-window
Shortcut! :ou[nmap]		(ex-cmd) like ":unmap" but for Operator-pending mode
Shortcut! :ounme[nu]		(ex-cmd) remove menu for Operator-pending mode
Shortcut! :ow[nsyntax]		(ex-cmd) set new local syntax highlight for this window
Shortcut! :pa[ckadd]		(ex-cmd) add a plugin from 'packpath'
Shortcut! :packl[oadall]		(ex-cmd) load all packages under 'packpath'
Shortcut! :pc[lose]		(ex-cmd) close preview window
Shortcut! :ped[it]		(ex-cmd) edit file in the preview window
Shortcut! :pe[rl]		(ex-cmd) execute Perl command
Shortcut! :p[rint]		(ex-cmd) print lines
Shortcut! :profd[el]		(ex-cmd) stop profiling a function or script
Shortcut! :prof[ile]		(ex-cmd) profiling functions and scripts
Shortcut! :pro[mptfind]		(ex-cmd) open GUI dialog for searching
Shortcut! :promptr[epl]		(ex-cmd) open GUI dialog for search/replace
Shortcut! :perld[o]		(ex-cmd) execute Perl command for each line
Shortcut! :po[p]		(ex-cmd) jump to older entry in tag stack
Shortcut! :popu[p]		(ex-cmd) popup a menu by name
Shortcut! :pp[op]		(ex-cmd) ":pop" in preview window
Shortcut! :pre[serve]		(ex-cmd) write all text to swap file
Shortcut! :prev[ious]		(ex-cmd) go to previous file in argument list
Shortcut! :ps[earch]		(ex-cmd) like ":ijump" but shows match in preview window
Shortcut! :pt[ag]		(ex-cmd) show tag in preview window
Shortcut! :ptN[ext]		(ex-cmd) |:tNext| in preview window
Shortcut! :ptf[irst]		(ex-cmd) |:trewind| in preview window
Shortcut! :ptj[ump]		(ex-cmd) |:tjump| and show tag in preview window
Shortcut! :ptl[ast]		(ex-cmd) |:tlast| in preview window
Shortcut! :ptn[ext]		(ex-cmd) |:tnext| in preview window
Shortcut! :ptp[revious]		(ex-cmd) |:tprevious| in preview window
Shortcut! :ptr[ewind]		(ex-cmd) |:trewind| in preview window
Shortcut! :pts[elect]		(ex-cmd) |:tselect| and show tag in preview window
Shortcut! :pu[t]		(ex-cmd) insert contents of register in the text
Shortcut! :pw[d]		(ex-cmd) print current directory
Shortcut! :py3		(ex-cmd) execute Python 3 command
Shortcut! :python3		(ex-cmd) same as :py3
Shortcut! :py3d[o]		(ex-cmd) execute Python 3 command for each line
Shortcut! :py3f[ile]		(ex-cmd) execute Python 3 script file
Shortcut! :py[thon]		(ex-cmd) execute Python command
Shortcut! :pyd[o]		(ex-cmd) execute Python command for each line
Shortcut! :pyf[ile]		(ex-cmd) execute Python script file
Shortcut! :pyx		(ex-cmd) execute |python_x| command
Shortcut! :pythonx		(ex-cmd) same as :pyx
Shortcut! :pyxd[o]		(ex-cmd) execute |python_x| command for each line
Shortcut! :pyxf[ile]		(ex-cmd) execute |python_x| script file
Shortcut! :q[uit]		(ex-cmd) quit current window (when one window quit Vim)
Shortcut! :quita[ll]		(ex-cmd) quit Vim
Shortcut! :qa[ll]		(ex-cmd) quit Vim
Shortcut! :r[ead]		(ex-cmd) read file into the text
Shortcut! :rec[over]		(ex-cmd) recover a file from a swap file
Shortcut! :red[o]		(ex-cmd) redo one undone change
Shortcut! :redi[r]		(ex-cmd) redirect messages to a file or register
Shortcut! :redr[aw]		(ex-cmd) force a redraw of the display
Shortcut! :redraws[tatus]		(ex-cmd) force a redraw of the status line(s)
Shortcut! :redrawt[abline]		(ex-cmd)   force a redraw of the tabline 
Shortcut! :reg[isters]		(ex-cmd) display the contents of registers
Shortcut! :res[ize]		(ex-cmd) change current window height
Shortcut! :ret[ab]		(ex-cmd) change tab size
Shortcut! :retu[rn]		(ex-cmd) return from a user function
Shortcut! :rew[ind]		(ex-cmd) go to the first file in the argument list
Shortcut! :ri[ght]		(ex-cmd) right align text
Shortcut! :rightb[elow]		(ex-cmd) make split window appear right or below
Shortcut! :rub[y]		(ex-cmd) execute Ruby command
Shortcut! :rubyd[o]		(ex-cmd) execute Ruby command for each line
Shortcut! :rubyf[ile]		(ex-cmd) execute Ruby script file
Shortcut! :rund[o]		(ex-cmd) read undo information from a file
Shortcut! :ru[ntime]		(ex-cmd) source vim scripts in 'runtimepath'
Shortcut! :rv[iminfo]		(ex-cmd) read from viminfo file
Shortcut! :s[ubstitute]		(ex-cmd) find and replace text
Shortcut! :sN[ext]		(ex-cmd) split window and go to previous file in argument list
Shortcut! :san[dbox]		(ex-cmd) execute a command in the sandbox
Shortcut! :sa[rgument]		(ex-cmd) split window and go to specific file in argument list
Shortcut! :sal[l]		(ex-cmd) open a window for each file in argument list
Shortcut! :sav[eas]		(ex-cmd) save file under another name.
Shortcut! :sb[uffer]		(ex-cmd) split window and go to specific file in the buffer list
Shortcut! :sbN[ext]		(ex-cmd) split window and go to previous file in the buffer list
Shortcut! :sba[ll]		(ex-cmd) open a window for each file in the buffer list
Shortcut! :sbf[irst]		(ex-cmd) split window and go to first file in the buffer list
Shortcut! :sbl[ast]		(ex-cmd) split window and go to last file in buffer list
Shortcut! :sbm[odified]		(ex-cmd) split window and go to modified file in the buffer list
Shortcut! :sbn[ext]		(ex-cmd) split window and go to next file in the buffer list
Shortcut! :sbp[revious]		(ex-cmd) split window and go to previous file in the buffer list
Shortcut! :sbr[ewind]		(ex-cmd) split window and go to first file in the buffer list
Shortcut! :scr[iptnames]		(ex-cmd) list names of all sourced Vim scripts
Shortcut! :scripte[ncoding]		(ex-cmd)   encoding used in sourced Vim script 
Shortcut! :scriptv[ersion]		(ex-cmd)    version of Vim script used 
Shortcut! :scs[cope]		(ex-cmd) split window and execute cscope command
Shortcut! :se[t]		(ex-cmd) show or set options
Shortcut! :setf[iletype]		(ex-cmd) set 'filetype', unless it was set already
Shortcut! :setg[lobal]		(ex-cmd) show global values of options
Shortcut! :setl[ocal]		(ex-cmd) show or set options locally
Shortcut! :sf[ind]		(ex-cmd) split current window and edit file in 'path'
Shortcut! :sfir[st]		(ex-cmd) split window and go to first file in the argument list
Shortcut! :sh[ell]		(ex-cmd) escape to a shell
Shortcut! :sim[alt]		(ex-cmd) Win32 GUI: simulate Windows ALT key
Shortcut! :sig[n]		(ex-cmd) manipulate signs
Shortcut! :sil[ent]		(ex-cmd) run a command silently
Shortcut! :sl[eep]		(ex-cmd) do nothing for a few seconds
Shortcut! :sla[st]		(ex-cmd) split window and go to last file in the argument list
Shortcut! :sm[agic]		(ex-cmd) :substitute with 'magic'
Shortcut! :smap		(ex-cmd) like ":map" but for Select mode
Shortcut! :smapc[lear]		(ex-cmd) remove all mappings for Select mode
Shortcut! :sme[nu]		(ex-cmd) add menu for Select mode
Shortcut! :smi[le]		(ex-cmd) make the user happy
Shortcut! :sn[ext]		(ex-cmd) split window and go to next file in the argument list
Shortcut! :sno[magic]		(ex-cmd) :substitute with 'nomagic'
Shortcut! :snor[emap]		(ex-cmd) like ":noremap" but for Select mode
Shortcut! :snoreme[nu]		(ex-cmd) like ":noremenu" but for Select mode
Shortcut! :sor[t]		(ex-cmd) sort lines
Shortcut! :so[urce]		(ex-cmd) read Vim or Ex commands from a file
Shortcut! :spelld[ump]		(ex-cmd) split window and fill with all correct words
Shortcut! :spe[llgood]		(ex-cmd) add good word for spelling
Shortcut! :spelli[nfo]		(ex-cmd) show info about loaded spell files
Shortcut! :spellr[epall]		(ex-cmd) replace all bad words like last |z=|
Shortcut! :spellu[ndo]		(ex-cmd) remove good or bad word
Shortcut! :spellw[rong]		(ex-cmd) add spelling mistake
Shortcut! :sp[lit]		(ex-cmd) split current window
Shortcut! :spr[evious]		(ex-cmd) split window and go to previous file in the argument list
Shortcut! :sre[wind]		(ex-cmd) split window and go to first file in the argument list
Shortcut! :st[op]		(ex-cmd) suspend the editor or escape to a shell
Shortcut! :sta[g]		(ex-cmd) split window and jump to a tag
Shortcut! :star[tinsert]		(ex-cmd) start Insert mode
Shortcut! :startg[replace]		(ex-cmd)  start Virtual Replace mode 
Shortcut! :startr[eplace]		(ex-cmd) start Replace mode
Shortcut! :stopi[nsert]		(ex-cmd) stop Insert mode
Shortcut! :stj[ump]		(ex-cmd) do ":tjump" and split window
Shortcut! :sts[elect]		(ex-cmd) do ":tselect" and split window
Shortcut! :sun[hide]		(ex-cmd) same as ":unhide"
Shortcut! :sunm[ap]		(ex-cmd) like ":unmap" but for Select mode
Shortcut! :sunme[nu]		(ex-cmd) remove menu for Select mode
Shortcut! :sus[pend]		(ex-cmd) same as ":stop"
Shortcut! :sv[iew]		(ex-cmd) split window and edit file read-only
Shortcut! :sw[apname]		(ex-cmd) show the name of the current swap file
Shortcut! :sy[ntax]		(ex-cmd) syntax highlighting
Shortcut! :synti[me]		(ex-cmd) measure syntax highlighting speed
Shortcut! :sync[bind]		(ex-cmd) sync scroll binding
Shortcut! :t		(ex-cmd) same as ":copy"
Shortcut! :tN[ext]		(ex-cmd) jump to previous matching tag
Shortcut! :tabN[ext]		(ex-cmd) go to previous tab page
Shortcut! :tabc[lose]		(ex-cmd) close current tab page
Shortcut! :tabdo		(ex-cmd) execute command in each tab page
Shortcut! :tabe[dit]		(ex-cmd) edit a file in a new tab page
Shortcut! :tabf[ind]		(ex-cmd) find file in 'path', edit it in a new tab page
Shortcut! :tabfir[st]		(ex-cmd) go to first tab page
Shortcut! :tabl[ast]		(ex-cmd) go to last tab page
Shortcut! :tabm[ove]		(ex-cmd) move tab page to other position
Shortcut! :tabnew		(ex-cmd) edit a file in a new tab page
Shortcut! :tabn[ext]		(ex-cmd) go to next tab page
Shortcut! :tabo[nly]		(ex-cmd) close all tab pages except the current one
Shortcut! :tabp[revious]		(ex-cmd) go to previous tab page
Shortcut! :tabr[ewind]		(ex-cmd) go to first tab page
Shortcut! :tabs		(ex-cmd) list the tab pages and what they contain
Shortcut! :tab		(ex-cmd) create new tab when opening new window
Shortcut! :ta[g]		(ex-cmd) jump to tag
Shortcut! :tags		(ex-cmd) show the contents of the tag stack
Shortcut! :tcd		(ex-cmd) change directory for tab page
Shortcut! :tch[dir]		(ex-cmd) change directory for tab page
Shortcut! :tc[l]		(ex-cmd) execute Tcl command
Shortcut! :tcld[o]		(ex-cmd) execute Tcl command for each line
Shortcut! :tclf[ile]		(ex-cmd) execute Tcl script file
Shortcut! :te[aroff]		(ex-cmd) tear-off a menu
Shortcut! :ter[minal]		(ex-cmd) open a terminal window
Shortcut! :tf[irst]		(ex-cmd) jump to first matching tag
Shortcut! :th[row]		(ex-cmd) throw an exception
Shortcut! :tj[ump]		(ex-cmd) like ":tselect", but jump directly when there is only one match
Shortcut! :tl[ast]		(ex-cmd) jump to last matching tag
Shortcut! :tlm[enu]		(ex-cmd) add menu for Terminal-Job mode
Shortcut! :tln[oremenu]		(ex-cmd) like ":noremenu" but for Terminal-Job mode
Shortcut! :tlu[nmenu]		(ex-cmd) remove menu for Terminal-Job mode
Shortcut! :tmapc[lear]		(ex-cmd) remove all mappings for Terminal-Job mode
Shortcut! :tma[p]		(ex-cmd) like ":map" but for Terminal-Job mode
Shortcut! :tm[enu]		(ex-cmd) define menu tooltip
Shortcut! :tn[ext]		(ex-cmd) jump to next matching tag
Shortcut! :tno[remap]		(ex-cmd) like ":noremap" but for Terminal-Job mode
Shortcut! :to[pleft]		(ex-cmd) make split window appear at top or far left
Shortcut! :tp[revious]		(ex-cmd) jump to previous matching tag
Shortcut! :tr[ewind]		(ex-cmd) jump to first matching tag
Shortcut! :try		(ex-cmd) execute commands, abort on error or exception
Shortcut! :ts[elect]		(ex-cmd) list matching tags and select one
Shortcut! :tunma[p]		(ex-cmd) like ":unmap" but for Terminal-Job mode
Shortcut! :tu[nmenu]		(ex-cmd) remove menu tooltip
Shortcut! :u[ndo]		(ex-cmd) undo last change(s)
Shortcut! :undoj[oin]		(ex-cmd) join next change with previous undo block
Shortcut! :undol[ist]		(ex-cmd) list leafs of the undo tree
Shortcut! :una[bbreviate]		(ex-cmd) remove abbreviation
Shortcut! :unh[ide]		(ex-cmd) open a window for each loaded file in the buffer list
Shortcut! :unl[et]		(ex-cmd) delete variable
Shortcut! :unlo[ckvar]		(ex-cmd) unlock variables
Shortcut! :unm[ap]		(ex-cmd) remove mapping
Shortcut! :unme[nu]		(ex-cmd) remove menu
Shortcut! :uns[ilent]		(ex-cmd) run a command not silently
Shortcut! :up[date]		(ex-cmd) write buffer if modified
Shortcut! :v[global]		(ex-cmd) execute commands for not matching lines
Shortcut! :ve[rsion]		(ex-cmd) print version number and other info
Shortcut! :verb[ose]		(ex-cmd) execute command with 'verbose' set
Shortcut! :vert[ical]		(ex-cmd) make following command split vertically
Shortcut! :vim[grep]		(ex-cmd) search for pattern in files
Shortcut! :vimgrepa[dd]		(ex-cmd) like :vimgrep, but append to current list
Shortcut! :vi[sual]		(ex-cmd) same as ":edit", but turns off "Ex" mode
Shortcut! :viu[sage]		(ex-cmd) overview of Normal mode commands
Shortcut! :vie[w]		(ex-cmd) edit a file read-only
Shortcut! :vm[ap]		(ex-cmd) like ":map" but for Visual+Select mode
Shortcut! :vmapc[lear]		(ex-cmd) remove all mappings for Visual+Select mode
Shortcut! :vme[nu]		(ex-cmd) add menu for Visual+Select mode
Shortcut! :vne[w]		(ex-cmd) create a new empty window, vertically split
Shortcut! :vn[oremap]		(ex-cmd) like ":noremap" but for Visual+Select mode
Shortcut! :vnoreme[nu]		(ex-cmd) like ":noremenu" but for Visual+Select mode
Shortcut! :vs[plit]		(ex-cmd) split current window vertically
Shortcut! :vu[nmap]		(ex-cmd) like ":unmap" but for Visual+Select mode
Shortcut! :vunme[nu]		(ex-cmd) remove menu for Visual+Select mode
Shortcut! :windo		(ex-cmd) execute command in each window
Shortcut! :w[rite]		(ex-cmd) write to a file
Shortcut! :wN[ext]		(ex-cmd) write to a file and go to previous file in argument list
Shortcut! :wa[ll]		(ex-cmd) write all (changed) buffers
Shortcut! :wh[ile]		(ex-cmd) execute loop for as long as condition met
Shortcut! :wi[nsize]		(ex-cmd) get or set window size (obsolete)
Shortcut! :winc[md]		(ex-cmd) execute a Window (C-W) command
Shortcut! :winp[os]		(ex-cmd) get or set window position
Shortcut! :wn[ext]		(ex-cmd) write to a file and go to next file in argument list
Shortcut! :wp[revious]		(ex-cmd) write to a file and go to previous file in argument list
Shortcut! :wq		(ex-cmd) write to a file and quit window or Vim
Shortcut! :wqa[ll]		(ex-cmd) write all changed buffers and quit Vim
Shortcut! :wu[ndo]		(ex-cmd) write undo information to a file
Shortcut! :wv[iminfo]		(ex-cmd) write to viminfo file
Shortcut! :x[it]		(ex-cmd) write if buffer changed and quit window or Vim
Shortcut! :xa[ll]		(ex-cmd) same as ":wqall"
Shortcut! :xmapc[lear]		(ex-cmd) remove all mappings for Visual mode
Shortcut! :xm[ap]		(ex-cmd) like ":map" but for Visual mode
Shortcut! :xme[nu]		(ex-cmd) add menu for Visual mode
Shortcut! :xr[estore]		(ex-cmd) restores the X server connection
Shortcut! :xn[oremap]		(ex-cmd) like ":noremap" but for Visual mode
Shortcut! :xnoreme[nu]		(ex-cmd) like ":noremenu" but for Visual mode
Shortcut! :xu[nmap]		(ex-cmd) like ":unmap" but for Visual mode
Shortcut! :xunme[nu]		(ex-cmd) remove menu for Visual mode
Shortcut! :y[ank]		(ex-cmd) yank lines into a register
Shortcut! :z		(ex-cmd) print some lines
Shortcut! :~		(ex-cmd) repeat last ":substitute"
