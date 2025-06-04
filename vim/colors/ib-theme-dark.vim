" ib-theme-dark.vim - IBM-inspired dark theme for VIM
" Maintainer: iB-theme <themanpfc@outlook.com>
" Version: 1.0.0
" URL: https://github.com/themanpfc/iB-theme
" License: GPL v3+

" Description:
" IBM-inspired dark theme for VIM based on IBM Carbon Design System.
" Provides professional appearance with high contrast and readability.

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "ib-theme-dark"

" IBM Carbon Design System Colors
let s:ibm_gray_100 = "#161616"    " Background
let s:ibm_gray_90  = "#262626"    " Editor background
let s:ibm_gray_80  = "#393939"    " Subtle background
let s:ibm_gray_70  = "#525252"    " UI elements
let s:ibm_gray_60  = "#6f6f6f"    " Disabled text
let s:ibm_gray_50  = "#8d8d8d"    " Secondary text
let s:ibm_gray_40  = "#a8a8a8"    " Placeholder text
let s:ibm_gray_30  = "#c6c6c6"    " Tertiary text
let s:ibm_gray_20  = "#e0e0e0"    " Primary text alt
let s:ibm_gray_10  = "#f4f4f4"    " Field background
let s:ibm_white    = "#ffffff"    " Primary text

" IBM Color Palette
let s:ibm_blue_40  = "#78a9ff"    " Functions
let s:ibm_blue_60  = "#0f62fe"    " Accent/Links
let s:ibm_blue_70  = "#0043ce"    " Functions alt
let s:ibm_green_50 = "#42be65"    " Strings
let s:ibm_green_60 = "#198038"    " Success
let s:ibm_purple_40 = "#be95ff"   " Keywords
let s:ibm_purple_60 = "#8a3ffc"   " Keywords alt
let s:ibm_magenta_40 = "#ff7eb6"  " Classes/Types
let s:ibm_magenta_70 = "#9f1853"  " Classes alt
let s:ibm_red_40   = "#ff8389"    " Numbers/Errors
let s:ibm_red_60   = "#da1e28"    " Errors
let s:ibm_yellow_30 = "#f1c21b"   " Warnings
let s:ibm_cyan_40  = "#33b1ff"    " Constants

" Helper function for setting highlights
function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  if a:guifg != ""
    exec "hi " . a:group . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=" . a:guibg
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
  if a:guisp != ""
    exec "hi " . a:group . " guisp=" . a:guisp
  endif
endfunction

" Basic UI Elements
call s:hi("Normal", s:ibm_white, s:ibm_gray_100, "15", "0", "", "")
call s:hi("Cursor", s:ibm_gray_100, s:ibm_blue_60, "0", "12", "", "")
call s:hi("CursorLine", "", s:ibm_gray_90, "", "8", "none", "")
call s:hi("CursorColumn", "", s:ibm_gray_90, "", "8", "", "")
call s:hi("ColorColumn", "", s:ibm_gray_90, "", "8", "", "")
call s:hi("LineNr", s:ibm_gray_60, s:ibm_gray_100, "8", "0", "", "")
call s:hi("CursorLineNr", s:ibm_white, s:ibm_gray_90, "15", "8", "bold", "")
call s:hi("VertSplit", s:ibm_gray_70, s:ibm_gray_100, "8", "0", "", "")
call s:hi("MatchParen", s:ibm_white, s:ibm_blue_60, "15", "12", "bold", "")
call s:hi("StatusLine", s:ibm_white, s:ibm_gray_80, "15", "8", "bold", "")
call s:hi("StatusLineNC", s:ibm_gray_50, s:ibm_gray_90, "8", "8", "", "")
call s:hi("Pmenu", s:ibm_white, s:ibm_gray_80, "15", "8", "", "")
call s:hi("PmenuSel", s:ibm_white, s:ibm_blue_60, "15", "12", "bold", "")
call s:hi("PmenuSbar", "", s:ibm_gray_70, "", "8", "", "")
call s:hi("PmenuThumb", "", s:ibm_gray_50, "", "7", "", "")
call s:hi("TabLine", s:ibm_gray_50, s:ibm_gray_90, "8", "8", "", "")
call s:hi("TabLineSel", s:ibm_white, s:ibm_gray_80, "15", "8", "bold", "")
call s:hi("TabLineFill", "", s:ibm_gray_90, "", "8", "", "")
call s:hi("WildMenu", s:ibm_white, s:ibm_blue_60, "15", "12", "bold", "")

" Search and Selection
call s:hi("Search", s:ibm_white, s:ibm_blue_60, "15", "12", "bold", "")
call s:hi("IncSearch", s:ibm_white, s:ibm_blue_60, "15", "12", "bold", "")
call s:hi("Visual", "", s:ibm_gray_80, "", "8", "", "")
call s:hi("VisualNOS", "", s:ibm_gray_80, "", "8", "", "")

" Messages and Errors
call s:hi("ErrorMsg", s:ibm_red_40, s:ibm_gray_100, "9", "0", "bold", "")
call s:hi("WarningMsg", s:ibm_yellow_30, s:ibm_gray_100, "11", "0", "bold", "")
call s:hi("ModeMsg", s:ibm_blue_40, "", "12", "", "bold", "")
call s:hi("MoreMsg", s:ibm_green_50, "", "10", "", "bold", "")
call s:hi("Question", s:ibm_green_50, "", "10", "", "bold", "")

" Folding
call s:hi("Folded", s:ibm_gray_50, s:ibm_gray_90, "8", "8", "", "")
call s:hi("FoldColumn", s:ibm_gray_60, s:ibm_gray_100, "8", "0", "", "")

" Diff
call s:hi("DiffAdd", s:ibm_white, s:ibm_green_60, "15", "10", "", "")
call s:hi("DiffChange", s:ibm_white, s:ibm_yellow_30, "15", "11", "", "")
call s:hi("DiffDelete", s:ibm_white, s:ibm_red_60, "15", "9", "", "")
call s:hi("DiffText", s:ibm_white, s:ibm_blue_60, "15", "12", "bold", "")

" Spelling
call s:hi("SpellBad", "", "", "", "", "undercurl", s:ibm_red_40)
call s:hi("SpellCap", "", "", "", "", "undercurl", s:ibm_blue_40)
call s:hi("SpellLocal", "", "", "", "", "undercurl", s:ibm_cyan_40)
call s:hi("SpellRare", "", "", "", "", "undercurl", s:ibm_magenta_40)

" Syntax Highlighting
call s:hi("Comment", s:ibm_gray_50, "", "8", "", "italic", "")
call s:hi("Constant", s:ibm_cyan_40, "", "14", "", "", "")
call s:hi("String", s:ibm_green_50, "", "10", "", "", "")
call s:hi("Character", s:ibm_green_50, "", "10", "", "", "")
call s:hi("Number", s:ibm_red_40, "", "9", "", "", "")
call s:hi("Boolean", s:ibm_red_40, "", "9", "", "", "")
call s:hi("Float", s:ibm_red_40, "", "9", "", "", "")

call s:hi("Identifier", s:ibm_white, "", "15", "", "", "")
call s:hi("Function", s:ibm_blue_40, "", "12", "", "bold", "")

call s:hi("Statement", s:ibm_purple_40, "", "13", "", "bold", "")
call s:hi("Conditional", s:ibm_purple_40, "", "13", "", "bold", "")
call s:hi("Repeat", s:ibm_purple_40, "", "13", "", "bold", "")
call s:hi("Label", s:ibm_purple_40, "", "13", "", "bold", "")
call s:hi("Operator", s:ibm_white, "", "15", "", "", "")
call s:hi("Keyword", s:ibm_purple_40, "", "13", "", "bold", "")
call s:hi("Exception", s:ibm_purple_40, "", "13", "", "bold", "")

call s:hi("PreProc", s:ibm_purple_40, "", "13", "", "", "")
call s:hi("Include", s:ibm_purple_40, "", "13", "", "", "")
call s:hi("Define", s:ibm_purple_40, "", "13", "", "", "")
call s:hi("Macro", s:ibm_purple_40, "", "13", "", "", "")
call s:hi("PreCondit", s:ibm_purple_40, "", "13", "", "", "")

call s:hi("Type", s:ibm_magenta_40, "", "5", "", "bold", "")
call s:hi("StorageClass", s:ibm_magenta_40, "", "5", "", "bold", "")
call s:hi("Structure", s:ibm_magenta_40, "", "5", "", "bold", "")
call s:hi("Typedef", s:ibm_magenta_40, "", "5", "", "bold", "")

call s:hi("Special", s:ibm_cyan_40, "", "14", "", "", "")
call s:hi("SpecialChar", s:ibm_cyan_40, "", "14", "", "", "")
call s:hi("Tag", s:ibm_cyan_40, "", "14", "", "", "")
call s:hi("Delimiter", s:ibm_white, "", "15", "", "", "")
call s:hi("SpecialComment", s:ibm_gray_40, "", "8", "", "italic", "")
call s:hi("Debug", s:ibm_red_40, "", "9", "", "", "")

call s:hi("Underlined", s:ibm_blue_60, "", "12", "", "underline", "")
call s:hi("Ignore", s:ibm_gray_60, "", "8", "", "", "")
call s:hi("Error", s:ibm_red_40, s:ibm_gray_100, "9", "0", "bold", "")
call s:hi("Todo", s:ibm_yellow_30, s:ibm_gray_100, "11", "0", "bold", "")

" Language-specific highlights
" HTML
call s:hi("htmlTag", s:ibm_blue_40, "", "12", "", "", "")
call s:hi("htmlEndTag", s:ibm_blue_40, "", "12", "", "", "")
call s:hi("htmlTagName", s:ibm_blue_40, "", "12", "", "bold", "")
call s:hi("htmlArg", s:ibm_magenta_40, "", "5", "", "", "")
call s:hi("htmlSpecialChar", s:ibm_cyan_40, "", "14", "", "", "")

" CSS
call s:hi("cssBraces", s:ibm_white, "", "15", "", "", "")
call s:hi("cssClassName", s:ibm_magenta_40, "", "5", "", "", "")
call s:hi("cssClassNameDot", s:ibm_white, "", "15", "", "", "")
call s:hi("cssProp", s:ibm_blue_40, "", "12", "", "", "")
call s:hi("cssAttr", s:ibm_green_50, "", "10", "", "", "")

" JavaScript
call s:hi("javaScriptFunction", s:ibm_purple_40, "", "13", "", "bold", "")
call s:hi("javaScriptRailsFunction", s:ibm_blue_40, "", "12", "", "", "")
call s:hi("javaScriptBraces", s:ibm_white, "", "15", "", "", "")

" Python
call s:hi("pythonFunction", s:ibm_blue_40, "", "12", "", "bold", "")
call s:hi("pythonBuiltin", s:ibm_cyan_40, "", "14", "", "", "")
call s:hi("pythonDecorator", s:ibm_purple_40, "", "13", "", "", "")

" Git
call s:hi("gitcommitOverflow", s:ibm_red_40, "", "9", "", "", "")
call s:hi("gitcommitSummary", s:ibm_green_50, "", "10", "", "", "")
call s:hi("gitcommitComment", s:ibm_gray_50, "", "8", "", "italic", "")
call s:hi("gitcommitUntracked", s:ibm_gray_50, "", "8", "", "italic", "")
call s:hi("gitcommitDiscarded", s:ibm_gray_50, "", "8", "", "italic", "")
call s:hi("gitcommitSelected", s:ibm_gray_50, "", "8", "", "italic", "")
call s:hi("gitcommitHeader", s:ibm_purple_40, "", "13", "", "", "")
call s:hi("gitcommitSelectedType", s:ibm_blue_40, "", "12", "", "", "")
call s:hi("gitcommitUnmergedType", s:ibm_blue_40, "", "12", "", "", "")
call s:hi("gitcommitDiscardedType", s:ibm_blue_40, "", "12", "", "", "")
call s:hi("gitcommitBranch", s:ibm_magenta_40, "", "5", "", "bold", "")
call s:hi("gitcommitUntrackedFile", s:ibm_yellow_30, "", "11", "", "", "")
call s:hi("gitcommitUnmergedFile", s:ibm_red_40, "", "9", "", "bold", "")
call s:hi("gitcommitDiscardedFile", s:ibm_red_40, "", "9", "", "bold", "")
call s:hi("gitcommitSelectedFile", s:ibm_green_50, "", "10", "", "bold", "")

" Markdown
call s:hi("markdownCode", s:ibm_green_50, "", "10", "", "", "")
call s:hi("markdownError", s:ibm_white, s:ibm_gray_100, "15", "0", "", "")
call s:hi("markdownCodeBlock", s:ibm_green_50, "", "10", "", "", "")
call s:hi("markdownHeadingDelimiter", s:ibm_blue_40, "", "12", "", "bold", "")

" NERDTree
call s:hi("NERDTreeDirSlash", s:ibm_blue_40, "", "12", "", "", "")
call s:hi("NERDTreeExecFile", s:ibm_green_50, "", "10", "", "", "")

" Remove functions
delf s:hi

" Must be at the end, because of ctermbg=234 bug.
" https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
set background=dark 