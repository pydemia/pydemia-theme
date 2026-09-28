" Vim color file
" Author: Gertjan Reynaert (port from theme of Wes Bos)
" Notes:  Cobalt2 color scheme port for VIM

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "cobalt2"

if has("gui_running") || &t_Co == 88 || &t_Co == 256
  let s:low_color = 0
else
  let s:low_color = 1
endif
" Color approximation functions by Henry So, Jr. and David Liang

" returns an approximate grey index for the given grey level
fun! s:grey_number(x)
  if &t_Co == 88
    if a:x < 23
      return 0
    elseif a:x < 69
      return 1
    elseif a:x < 103
      return 2
    elseif a:x < 127
      return 3
    elseif a:x < 150
      return 4
    elseif a:x < 173
      return 5
    elseif a:x < 196
      return 6
    elseif a:x < 219
      return 7
    elseif a:x < 243
      return 8
    else
      return 9
    endif
  else
    if a:x < 14
      return 0
    else
      let l:n = (a:x - 8) / 10
      let l:m = (a:x - 8) % 10
      if l:m < 5
        return l:n
      else
        return l:n + 1
      endif
    endif
  endif
endfun

" returns the actual grey level represented by the grey index
fun! s:grey_level(n)
  if &t_Co == 88
    if a:n == 0
      return 0
    elseif a:n == 1
      return 46
    elseif a:n == 2
      return 92
    elseif a:n == 3
      return 115
    elseif a:n == 4
      return 139
    elseif a:n == 5
      return 162
    elseif a:n == 6
      return 185
    elseif a:n == 7
      return 208
    elseif a:n == 8
      return 231
    else
      return 255
    endif
  else
    if a:n == 0
      return 0
    else
      return 8 + (a:n * 10)
    endif
  endif
endfun

" returns the palette index for the given grey index
fun! s:grey_color(n)
  if &t_Co == 88
    if a:n == 0
      return 16
    elseif a:n == 9
      return 79
    else
      return 79 + a:n
    endif
  else
    if a:n == 0
      return 16
    elseif a:n == 25
      return 231
    else
      return 231 + a:n
    endif
  endif
endfun

" returns an approximate color index for the given color level
fun! s:rgb_number(x)
  if &t_Co == 88
    if a:x < 69
      return 0
    elseif a:x < 172
      return 1
    elseif a:x < 230
      return 2
    else
      return 3
    endif
  else
    if a:x < 75
      return 0
    else
      let l:n = (a:x - 55) / 40
      let l:m = (a:x - 55) % 40
      if l:m < 20
        return l:n
      else
        return l:n + 1
      endif
    endif
  endif
endfun

" returns the actual color level for the given color index
fun! s:rgb_level(n)
  if &t_Co == 88
    if a:n == 0
      return 0
    elseif a:n == 1
      return 139
    elseif a:n == 2
      return 205
    else
      return 255
    endif
  else
    if a:n == 0
      return 0
    else
      return 55 + (a:n * 40)
    endif
  endif
endfun

" returns the palette index for the given R/G/B color indices
fun! s:rgb_color(x, y, z)
  if &t_Co == 88
    return 16 + (a:x * 16) + (a:y * 4) + a:z
  else
    return 16 + (a:x * 36) + (a:y * 6) + a:z
  endif
endfun

" returns the palette index to approximate the given R/G/B color levels
fun! s:color(r, g, b)
  " get the closest grey
  let l:gx = s:grey_number(a:r)
  let l:gy = s:grey_number(a:g)
  let l:gz = s:grey_number(a:b)

  " get the closest color
  let l:x = s:rgb_number(a:r)
  let l:y = s:rgb_number(a:g)
  let l:z = s:rgb_number(a:b)

  if l:gx == l:gy && l:gy == l:gz
    " there are two possibilities
    let l:dgr = s:grey_level(l:gx) - a:r
    let l:dgg = s:grey_level(l:gy) - a:g
    let l:dgb = s:grey_level(l:gz) - a:b
    let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
    let l:dr = s:rgb_level(l:gx) - a:r
    let l:dg = s:rgb_level(l:gy) - a:g
    let l:db = s:rgb_level(l:gz) - a:b
    let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
    if l:dgrey < l:drgb
      " use the grey
      return s:grey_color(l:gx)
    else
      " use the color
      return s:rgb_color(l:x, l:y, l:z)
    endif
  else
    " only one possibility
    return s:rgb_color(l:x, l:y, l:z)
  endif
endfun

" returns the palette index to approximate the 'rrggbb' hex string
fun! s:rgb(rgb)
  let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
  let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
  let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0
  return s:color(l:r, l:g, l:b)
endfun

" sets the highlighting for the given group
fun! s:X(group, fg, bg, attr, lcfg, lcbg)
  if s:low_color
    let l:fge = empty(a:lcfg)
    let l:bge = empty(a:lcbg)

    if !l:fge && !l:bge
      exec "hi ".a:group." ctermfg=".a:lcfg." ctermbg=".a:lcbg
    elseif !l:fge && l:bge
      exec "hi ".a:group." ctermfg=".a:lcfg." ctermbg=NONE"
    elseif l:fge && !l:bge
      exec "hi ".a:group." ctermfg=NONE ctermbg=".a:lcbg
    endif
  else
    let l:fge = empty(a:fg)
    let l:bge = empty(a:bg)

    if !l:fge && !l:bge
      exec "hi ".a:group." guifg=#".a:fg." guibg=#".a:bg." ctermfg=".s:rgb(a:fg)." ctermbg=".s:rgb(a:bg)
    elseif !l:fge && l:bge
      exec "hi ".a:group." guifg=#".a:fg." guibg=NONE ctermfg=".s:rgb(a:fg)." ctermbg=NONE"
    elseif l:fge && !l:bge
      exec "hi ".a:group." guifg=NONE guibg=#".a:bg." ctermfg=NONE ctermbg=".s:rgb(a:bg)
    endif
  endif

  if a:attr == ""
    exec "hi ".a:group." gui=none cterm=none"
  else
    let l:noitalic = join(filter(split(a:attr, ","), "v:val !=? 'italic'"), ",")
    if empty(l:noitalic)
      let l:noitalic = "none"
    endif
    exec "hi ".a:group." gui=".a:attr." cterm=".l:noitalic
  endif
endfun

if !exists("g:cobalt_bg")
  let g:cobalt_bg = "071B2C"                                            "#071B2C
end
let g:cobalt_line = "10273B"

" General colors
let g:black = "071B2C"                                                 " #071B2C
let g:darkest_grey = "102B42"                                          " #102B42
let g:darker_grey = "17364E"                                           " #17364E
let g:dark_grey = "6D889D"                                             " #6D889D
let g:grey = "82A3B8"                                                  " #82A3B8
let g:light_grey = "A5BBCA"                                            " #A5BBCA
let g:lighter_grey = "C4D4DE"                                          " #C4D4DE
let g:lightest_grey = "DAEAF3"                                         " #DAEAF3
let g:white = "DAEAF3"                                                 " #DAEAF3

let g:dark_orange = "F7A865"                                           " #F7A865
let g:light_orange = "F7A865"                                          " #F7A865
let g:yellow = "F4CF66"                                                " #F4CF66
let g:class_yellow = "F0D77F"                                          " #F0D77F
let g:light_yellow = "F5DFA0"                                          " #F5DFA0

let g:darkest_green = "23422F"                                         " #23422F
let g:dirty_green = "6FA67E"                                           " #6FA67E
let g:green = "9DD18D"                                                 " #9DD18D
let g:light_green = "B9E6A7"                                           " #B9E6A7
let g:lighter_green = "C9ECC0"                                         " #C9ECC0
let g:lightest_green = "DDF5D7"                                        " #DDF5D7

let g:dark_purple = "4A3D67"                                           " #4A3D67
let g:purple = "D18FD8"                                                " #D18FD8
let g:light_purple = "D7BFF7"                                          " #D7BFF7

let g:darkest_blue = "0D2840"                                          " #0D2840
let g:darker_blue = "204C6A"                                           " #204C6A
let g:dark_blue = "82A3B8"                                             " #82A3B8
let g:blue = "7DBDEB"                                                  " #7DBDEB
let g:light_blue = "A4D2F5"                                            " #A4D2F5
let g:greyish_blue = "82A3B8"                                          " #82A3B8
let g:dirty_blue = "6D889D"                                            " #6D889D
let g:cyan = "73CBD3"                                                  " #73CBD3

let g:aubergine =  "4A2739"                                            " #4A2739
let g:darker_red = "4A2739"                                            " #4A2739
let g:dark_red = "6C354A"                                              " #6C354A
let g:red = "FF7188"                                                   " #FF7188
let g:dark_pink = "F7988B"                                             " #F7988B
let g:pink = "F271A5"                                                  " #F271A5
let g:property_pink = "E1A0C9"                                         " #E1A0C9
let g:light_pink = "F6A4BE"                                            " #F6A4BE
let g:lightest_pink = "FAD0DB"                                         " #FAD0DB
let g:pale_pink = "E8A5B9"                                             " #E8A5B9
let g:dirty_pink = "DA8C9E"                                            " #DA8C9E

" Regex colors
let g:regex_or = g:green
let g:regex_group = g:green
let g:regex_quantifier = g:light_green
let g:regex_boundary = g:light_green
let g:regex_char_group = g:lighter_green
let g:regex_string = g:lightest_green
let g:regex_escape = g:light_green

" Vim essential color bindings
set background=dark

call s:X("Normal",g:white,g:cobalt_bg,"","","")
call s:X("Comment",g:dark_blue,"","italic","Grey","")
call s:X("Todo",g:dark_blue,"","bold","Grey", "")
call s:X("Constant",g:purple,"","","Magenta","")
call s:X("Special",g:cyan,"","","Cyan","")
call s:X("MoreMsg",g:light_green,"","","Green","")
call s:X("Delimiter",g:dirty_blue,"","","Grey","")

call s:X("String",g:green,"","","Green","")
hi! link StringDelimiter Delimiter

call s:X("Identifier",g:white,"","","White","")
call s:X("Structure",g:class_yellow,"","italic","Yellow","")
call s:X("Function",g:blue,"","","Blue","")
call s:X("Statement",g:dark_orange,"","","","")
call s:X("PreProc",g:dark_orange,"","",g:dark_orange,"")
call s:X("Operator",g:cyan,"","italic","Cyan","")

call s:X("Type",g:yellow,"","","Yellow","")
call s:X("NonText",g:dark_grey,g:cobalt_bg,"","Black","")

call s:X("SpecialKey",g:darker_grey,g:black,"","Black","")

call s:X("MatchParen",g:white,g:dark_purple,"bold","","")

call s:X("Directory",g:blue,"","","Blue","")
call s:X("ErrorMsg","",g:dark_red,"","","DarkRed")
hi! link Error ErrorMsg
call s:X("Question",g:green,"","","Green","")
call s:X("StorageClass",g:light_orange,"","","","")

" vim tabpane headers
call s:X("TabLine",g:black,g:lighter_grey,"italic","","Black")
call s:X("TabLineFill",g:light_grey,"","","","Black")
call s:X("TabLineSel",g:black,g:yellow,"italic,bold","Black","White")

" Auto-completion
call s:X("PMenu",g:lightest_grey,g:darkest_grey,"","","")
call s:X("PMenuSel",g:white,g:darker_blue,"","","")
call s:X("PMenuSBar","",g:dark_grey,"","","")
call s:X("PMenuThumb","",g:lightest_grey,"","","")

call s:X("Visual","",g:darker_blue,"","","Black")

call s:X("Cursor",g:cobalt_bg,g:yellow,"","","")
call s:X("CursorColumn","",g:cobalt_line,"","","Black")
call s:X("CursorLine","",g:cobalt_line,"","","Black")
call s:X("CursorLineNr",g:light_blue,"","none","White","")
call s:X("LineNr",g:dark_grey,g:cobalt_bg,"none","Black","")

call s:X("StatusLine",g:white,g:darker_blue,"italic","White","")
call s:X("StatusLineNC",g:white,g:darker_grey,"italic","White","Black")
call s:X("VertSplit",g:dirty_blue,"","","","")
call s:X("WildMenu",g:pale_pink,g:darkest_grey,"","Magenta","")

call s:X("Folded",g:light_grey,g:darker_grey,"italic","Black","")
call s:X("FoldColumn",g:dark_grey,g:black,"","","Black")
call s:X("SignColumn",g:dark_grey,g:darkest_grey,"","","Black")
call s:X("ColorColumn","",g:darkest_grey,"","","Black")

call s:X("Title",g:dirty_green,"","bold","Green","")

call s:X("Search",g:black,g:light_yellow,"underline","Magenta","")

" Spell Checking

call s:X("SpellBad",g:dark_red,"","underline","","DarkRed")
call s:X("SpellCap","",g:darkest_blue,"underline","","Blue")
call s:X("SpellRare","",g:aubergine,"underline","","DarkMagenta")
call s:X("SpellLocal","",g:darkest_green,"underline","","Green")

" Diff

hi! link diffRemoved Constant
hi! link diffAdded String
call s:X("DiffDelete",g:black,g:darker_red,"","DarkRed","DarkRed")
call s:X("DiffChange","",g:darkest_green,"","White","DarkBlue")
call s:X("DiffText",g:greyish_blue,g:black,"reverse","Yellow","")

" PHP

hi! link phpFunctions Function
hi! link phpSuperglobal Identifier
hi! link phpQuoteSingle StringDelimiter
hi! link phpQuoteDouble StringDelimiter
hi! link phpBoolean Constant
hi! link phpNull Constant
hi! link phpArrayPair Operator
hi! link phpOperator Normal
hi! link phpRelation Normal
hi! link phpVarSelector Identifier

" Python

hi! link pythonOperator Statement

" Ruby

call s:X("rubyClass",g:class_yellow,"","","Yellow","")
hi! link rubyModule rubyClass

call s:X("rubyInstanceVariable",g:lightest_grey,"","","Cyan","")
call s:X("rubySymbol",g:purple,"","","Magenta","")
hi! link rubyGlobalVariable rubyInstanceVariable

call s:X("rubyAccess",g:white,"","","","")

" params between pipes after do, and pipes themselfs
call s:X("rubyBlockParameter",g:lightest_grey,"","","Blue","")
call s:X("rubyBlockParameterList",g:white,"","","Blue","")

call s:X("rubyInterpolation",g:lighter_green,"","","Magenta","")
call s:X("rubyInterpolationDelimiter",g:white,"","","Magenta","")

call s:X("rubyRegexp",g:light_green,"","","","")            " usual character
call s:X("rubyRegexpAnchor",g:light_green,"","","","")      " ^ and $ indicator
call s:X("rubyRegexpCharClass",g:light_green,"","","","")   " \d
call s:X("rubyRegexpDelimiter",g:light_green,"","","","")   " open and closing /
call s:X("rubyRegexpEscape",g:light_green,"","","","")      " \ and escaped char
call s:X("rubyRegexpQuantifier",g:light_green,"","","","")  " ? and {3}
call s:X("rubyRegexpSpecial",g:light_green,"","","","")     " () and | char

" JavaScript

hi! link javaScriptValue Constant
hi! link javaScriptRegexpString rubyRegexp

call s:X("jsFunction",g:pink,"","","","")
call s:X("jsFuncCall",g:blue,"","","","")
call s:X("jsOperator",g:light_orange,"","","","")
call s:X("jsStorageClass",g:dark_orange,"","","","")
call s:X("jsFuncArgs",g:lightest_grey,"","","","")

call s:X("jsBuiltins",g:white,"","italic","","")
call s:X("jsUndefined",g:purple,"","","","")
call s:X("jsThis",g:light_pink,"","","","")
call s:X("jsPrototype",g:property_pink,"","","","")

call s:X("jsRegexpOr",g:regex_or,"","","","")                 " | highlight
call s:X("jsRegexpQuantifier",g:regex_quantifier,"","","","") " ? and {4}
call s:X("jsRegexpGroup",g:regex_group,"","","","")           " ( and )
call s:X("jsRegexpBoundary",g:regex_boundary,"","","","")     " start and end of regex
call s:X("jsRegexpCharClass",g:regex_char_group,"","","","")  " [A-z]
call s:X("jsRegexpString",g:regex_string,"","","","")         " regular text
call s:X("jsRegexpMod",g:pink,"","","","")
call s:X("jsRegexpBackRef",g:light_orange,"","","","")

" CoffeeScript

hi! link coffeeComment comment
hi! link coffeeBlockComment comment
hi! link coffeeTodo todo
hi! link coffeeHeregexComment comment
call s:X("coffeeKeyword",g:dark_orange,"","","","")
call s:X("coffeeObject",g:blue,"","","","")
call s:X("coffeeObjAssign",g:cyan,"","","","")
call s:X("coffeeExtendedOp",g:dark_orange,"","","","")
call s:X("coffeeParen",g:lightest_grey,"","","","")
call s:X("coffeeParens",g:lightest_grey,"","","","")
call s:X("coffeeSpecialOp",g:lightest_grey,"","","","")
call s:X("coffeeStatement",g:dark_orange,"","","","")
hi! link coffeeString String
hi! link coffeeHeredoc String
call s:X("coffeeInterpDelim",g:white,"","","","")
call s:X("coffeeInterp",g:lighter_green,"","","","")

call s:X("coffeeRegex",g:regex_escape,"","","","")
call s:X("coffeeEscape",g:regex_escape,"","","","")
call s:X("coffeeRegexCharSet",g:regex_group,"","","","")
call s:X("coffeeHeregex",g:regex_escape,"","","","")
call s:X("coffeeHeregexCharSet",g:regex_group,"","","","")

call s:X("coffeeSpecialIdent",g:lightest_grey,"","","","")
call s:X("coffeeBracket",g:white,"","","","")
call s:X("coffeeBrackets",g:white,"","","","")
call s:X("coffeeCurly",g:white,"","","","")
call s:X("coffeeCurlies",g:white,"","","","")
hi! link coffeeConditional Conditional
call s:X("coffeeSpecialVar",g:light_pink,"","","","")
call s:X("coffeeDotAccess",g:white,"","","","")
call s:X("coffeeConstant",g:purple,"","","","")
call s:X("coffeeRepeat",g:dark_orange,"","","","")
call s:X("coffeeGlobal",g:white,"","","","")
call s:X("coffeeOperator",g:dark_orange,"","","","")
hi! link coffeeSemicolonError ErrorMsg
hi! link coffeeReservedError ErrorMsg
hi! link coffeeSpaceError ErrorMsg

" HTML
call s:X("htmlTag",g:lightest_grey,"","","","")
call s:X("htmlEndTag",g:lightest_grey,"","","","")
call s:X("htmlTagName",g:light_blue,"","","","")
call s:X("htmlSpecialTagName",g:blue,"","","","")

call s:X("htmlArg",g:dark_orange,"","","","")
call s:X("htmlEvent",g:dark_orange,"","","","")
call s:X("htmlString",g:green,"","","","")

call s:X("htmlTitle",g:cyan,"","","","")
call s:X("htmlH1",g:light_orange,"","","","")
call s:X("htmlItalic",g:lightest_grey,"","","","")

" XML
hi! link xmlTag htmlTag
hi! link xmlTagName htmlTagName
hi! link xmlEndTag htmlTagName

hi! link xmlAttrib htmlArg
hi! link xmlEqual htmlString
hi! link xmlString htmlString

hi! link xmlEntityPunct htmlSpecialChar
hi! link xmlEntity htmlSpecialChar

" Haml
hi! link hamlTag htmlTag
hi! link hamlIdChar hamlId
hi! link hamlClassChar hamlClass
call s:X("hamlAttributes",g:pink,"","","","")
call s:X("hamlInterpolationDelimiter",g:green,"","","","")

" Markdown
call s:X("markdownH1",g:cyan,"","","","")
hi! link markdownH2 markdownH1
hi! link markdownH3 markdownH1
hi! link markdownH4 markdownH1
hi! link markdownH5 markdownH1
hi! link markdownH6 markdownH1
call s:X("markdownHeadingRule",g:dark_orange,"","","","")
hi! link markdownHeadingDelimiter markdownHeadingRule

call s:X("markdownRule",g:light_blue,"","","","")

call s:X("markdownCode",g:light_grey,"","","","")
hi! link markdownCodeBlock markdownCode
call s:X("markdownCodeDelimiter",g:dark_blue,"","","","")

call s:X("markdownLinkText",g:green,"","","","")
call s:X("markdownUrl",g:blue,"","","","")

call s:X("markdownId",g:cyan,"","","","")
hi! link markdownIdDeclaration markdownId

" CSS
call s:X("cssIdentifier",g:cyan,"","","","")
call s:X("cssIncludeKeyword",g:dark_orange,"","","","")
call s:X("cssMediaType",g:dirty_pink,"","","","")
call s:X("cssMediaKeyword",g:dark_orange,"","","","")
call s:X("cssInclude",g:white,"","","","")
call s:X("cssMediaProp",g:light_green,"","","","")
call s:X("cssValueLength",g:purple,"","","","")
call s:X("cssUnitDecorators",g:dark_orange,"","","","")
call s:X("cssBraces",g:white,"","","","")
call s:X("cssTagName",g:light_blue,"","","","")
call s:X("cssClassName",g:green,"","","","")
call s:X("cssPseudoClassId",g:light_orange,"","","","")
call s:X("cssPseudoClassFn",g:pink,"","","","")

call s:X("cssBoxAttr",g:light_yellow,"","","","")
hi! link cssValueNumber cssBoxAttr
hi! link cssCommonAttr cssBoxAttr
hi! link cssPositioningAttr cssBoxAttr
hi! link cssFontAttr cssBoxAttr
hi! link cssBorderAttr cssBoxAttr
hi! link cssTextAttr cssBoxAttr
hi! link cssDimensionAttr cssBoxAttr
hi! link cssBackgroundAttr cssBoxAttr
hi! link cssPageAttr cssBoxAttr
hi! link cssColorAttr cssBoxAttr
hi! link cssTransitionAttr cssBoxAttr
hi! link cssUIAttr cssBoxAttr

call s:X("cssBoxProp",g:light_green,"","","","")
hi! link cssTextProp cssBoxProp
hi! link cssDimensionProp cssBoxProp
hi! link cssFontProp cssBoxProp
hi! link cssPositioningProp cssBoxProp
hi! link cssBackgroundProp cssBoxProp
hi! link cssBorderProp cssBoxProp
hi! link cssPageProp cssBoxProp
hi! link cssColorProp cssBoxProp
hi! link cssTransitionProp cssBoxProp
hi! link cssUIProp cssBoxProp
hi! link cssTransformProp cssBoxProp

" SCSS/SASS
hi! link sassIdChar cssIdentifier
hi! link sassId cssIdentifier
hi! link sassClass cssClassName
hi! link sassCssAttribute cssBoxAttr

" JSON
call s:X("jsonBraces",g:purple,"","","","")
call s:X("jsonQuote",g:dark_blue,"","","","")
call s:X("jsonNoise",g:dark_blue,"","","","")
call s:X("jsonKeywordMatch",g:dark_blue,"","","","")

" Erlang

hi! link erlangAtom rubySymbol
hi! link erlangBIF rubyPredefinedIdentifier
hi! link erlangFunction rubyPredefinedIdentifier
hi! link erlangDirective Statement
hi! link erlangNode Identifier

" Lua

hi! link luaOperator Conditional

" C

hi! link cFormat Identifier
hi! link cOperator Constant

" Objective-C/Cocoa

hi! link objcClass Type
hi! link cocoaClass objcClass
hi! link objcSubclass objcClass
hi! link objcSuperclass objcClass
hi! link objcDirective rubyClass
hi! link objcStatement Constant
hi! link cocoaFunction Function
hi! link objcMethodName Identifier
hi! link objcMethodArg Normal
hi! link objcMessageName Identifier

" Vimscript

hi! link vimOper Normal

" Debugger.vim

call s:X("DbgCurrent",g:light_purple,g:dark_purple,"","White","DarkBlue")
call s:X("DbgBreakPt","",g:aubergine,"","","DarkMagenta")

" vim-indent-guides

if !exists("g:indent_guides_auto_colors")
  let g:indent_guides_auto_colors = 0
endif
call s:X("IndentGuidesOdd","",g:darkest_grey,"","","")
call s:X("IndentGuidesEven","",g:black,"","","")

" Plugins, etc.

hi! link TagListFileName Directory
call s:X("PreciseJumpTarget",g:lighter_green,g:darker_grey,"","White","Green")

" NERDTree

call s:X("NERDTreeHelp",g:dark_purple,"","","","")
call s:X("NERDTreeUp",g:dark_purple,"","","","")

call s:X("NERDTreeOpenable",g:yellow,"","","","")
call s:X("NERDTreeClosable",g:red,"","","","")
call s:X("NERDTreeDir",g:yellow,"","","","")
hi! link NERDTreeDirSlash Ignore

call s:X("NERDTreeExecFile",g:purple,"","","","")

" Grep search
call s:X("qfLineNr",g:dark_blue,"","","","")

" CTRLP file search
call s:X("CtrlPMatch",g:dark_orange,"","","","")

" Neomake signs
call s:X("NeomakeErrorMsg","",g:red,"","","")
call s:X("NeomakeWarningMsg",g:yellow,"","","","")

let g:neomake_error_sign = {
            \ 'text': '✖',
            \ 'texthl': 'NeomakeErrorMsg',
            \ }

let g:neomake_warning_sign = {
            \ 'text': '⚠',
            \ 'texthl': 'NeomakeWarningMsg',
            \ }

" Manual overrides for 256-color terminals. Dark colors auto-map badly.
if !exists("g:cobalt_bg_256")
  let g:cobalt_bg_256="NONE"
end

if !s:low_color
  hi StatusLineNC ctermbg=235
  hi Folded ctermbg=235
  hi FoldColumn ctermbg=234
  hi SignColumn ctermbg=236
  hi CursorColumn ctermbg=234
  hi CursorLine ctermbg=235
  hi SpecialKey ctermbg=234
  exec "hi NonText ctermbg=".g:cobalt_bg_256
  exec "hi LineNr ctermbg=".g:cobalt_bg_256
  hi DiffText ctermfg=110
  exec "hi Normal ctermbg=".g:cobalt_bg_256
  hi DbgBreakPt ctermbg=236
  hi IndentGuidesOdd ctermbg=235
  hi IndentGuidesEven ctermbg=234
endif

" delete functions
delf s:X
delf s:rgb
delf s:color
delf s:rgb_color
delf s:rgb_level
delf s:rgb_number
delf s:grey_color
delf s:grey_level
delf s:grey_number
