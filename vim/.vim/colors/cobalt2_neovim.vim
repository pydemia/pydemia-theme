" Cobalt 2 Vim Color Scheme
" Sublime Text original by Wes Bos
" Adapted for Vim by Marcel Bischoff
" --ALPHA VERSION--

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
  endif

  let g:colors_name = "cobalt2"

  hi Visual ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#204C6A gui=NONE
  hi VertSplit ctermfg=24 ctermbg=24 cterm=NONE guifg=#2A4960 guibg=#2A4960 gui=NONE
  hi StatusLine ctermfg=254 ctermbg=24 cterm=bold guifg=#DAEAF3 guibg=#204C6A gui=bold
  hi StatusLineNC ctermfg=254 ctermbg=235 cterm=NONE guifg=#DAEAF3 guibg=#102B42 gui=NONE
  hi Pmenu ctermfg=222 ctermbg=NONE cterm=NONE guifg=#EAC779 guibg=NONE gui=NONE
  hi PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#204C6A gui=NONE
  hi IncSearch ctermfg=234 ctermbg=150 cterm=NONE guifg=#071B2C guibg=#9DD18D gui=NONE
  hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
  hi Directory ctermfg=110 ctermbg=NONE cterm=NONE guifg=#7DBDEB guibg=NONE gui=NONE
  hi Folded ctermfg=110 ctermbg=234 cterm=NONE guifg=#82A3B8 guibg=#071B2C gui=NONE

  hi Normal ctermfg=254 ctermbg=234 cterm=NONE guifg=#DAEAF3 guibg=#071B2C gui=NONE
  hi Boolean ctermfg=210 ctermbg=NONE cterm=NONE guifg=#F29A82 guibg=NONE gui=NONE
  hi Character ctermfg=176 ctermbg=NONE cterm=NONE guifg=#D18FD8 guibg=NONE gui=NONE
  hi Comment ctermfg=110 ctermbg=NONE cterm=NONE guifg=#82A3B8 guibg=NONE gui=italic
  hi Conditional ctermfg=215 ctermbg=NONE cterm=NONE guifg=#F7A865 guibg=NONE gui=NONE
  hi Constant ctermfg=176 ctermbg=NONE cterm=NONE guifg=#D18FD8 guibg=NONE gui=NONE
  hi Define ctermfg=215 ctermbg=NONE cterm=NONE guifg=#F7A865 guibg=NONE gui=NONE
  hi DiffAdd ctermfg=254 ctermbg=237 cterm=bold guifg=#DAEAF3 guibg=#23422F gui=bold
  hi DiffDelete ctermfg=204 ctermbg=NONE cterm=NONE guifg=#FF7188 guibg=NONE gui=NONE
  hi DiffChange ctermfg=254 ctermbg=24 cterm=NONE guifg=#DAEAF3 guibg=#193E55 gui=NONE
  hi DiffText ctermfg=254 ctermbg=24 cterm=bold guifg=#DAEAF3 guibg=#204C6A gui=bold
  hi ErrorMsg ctermfg=254 ctermbg=236 cterm=NONE guifg=#DAEAF3 guibg=#4A2739 gui=NONE
  hi WarningMsg ctermfg=254 ctermbg=237 cterm=NONE guifg=#DAEAF3 guibg=#49351F gui=NONE
  hi Float ctermfg=176 ctermbg=NONE cterm=NONE guifg=#D18FD8 guibg=NONE gui=NONE
  hi Function ctermfg=117 ctermbg=NONE cterm=NONE guifg=#7DBDEB guibg=NONE gui=NONE
  hi Identifier ctermfg=254 ctermbg=NONE cterm=NONE guifg=#DAEAF3 guibg=NONE gui=NONE
  hi Keyword ctermfg=215 ctermbg=NONE cterm=NONE guifg=#F7A865 guibg=NONE gui=NONE
  hi Label ctermfg=150 ctermbg=NONE cterm=NONE guifg=#9DD18D guibg=NONE gui=NONE
  hi NonText ctermfg=222 ctermbg=235 cterm=NONE guifg=#EAC779 guibg=#102B42 gui=NONE
  hi Number ctermfg=176 ctermbg=NONE cterm=NONE guifg=#D18FD8 guibg=NONE gui=NONE
  hi Operator ctermfg=116 ctermbg=NONE cterm=NONE guifg=#73CBD3 guibg=NONE gui=NONE
  hi PreProc ctermfg=215 ctermbg=NONE cterm=NONE guifg=#F7A865 guibg=NONE gui=NONE
  hi Special ctermfg=116 ctermbg=NONE cterm=NONE guifg=#73CBD3 guibg=NONE gui=NONE
  hi SpecialKey ctermfg=222 ctermbg=236 cterm=NONE guifg=#EAC779 guibg=#17364E gui=NONE
  hi Statement ctermfg=215 ctermbg=NONE cterm=NONE guifg=#F7A865 guibg=NONE gui=NONE
  hi StorageClass ctermfg=215 ctermbg=NONE cterm=NONE guifg=#F7A865 guibg=NONE gui=NONE
  hi String ctermfg=150 ctermbg=NONE cterm=NONE guifg=#9DD18D guibg=NONE gui=NONE
  hi Tag ctermfg=221 ctermbg=NONE cterm=NONE guifg=#F4CF66 guibg=NONE gui=NONE
  hi Title ctermfg=254 ctermbg=NONE cterm=bold guifg=#DAEAF3 guibg=NONE gui=bold
  hi Todo ctermfg=110 ctermbg=NONE cterm=inverse,bold guifg=#82A3B8 guibg=NONE gui=inverse,bold,italic
  hi Type ctermfg=221 ctermbg=NONE cterm=NONE guifg=#F4CF66 guibg=NONE gui=NONE
  hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
  hi rubyClass ctermfg=222 ctermbg=NONE cterm=NONE guifg=#F0D77F guibg=NONE gui=NONE
  hi rubyFunction ctermfg=211 ctermbg=NONE cterm=NONE guifg=#F271A5 guibg=NONE gui=NONE
  hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
  hi rubySymbol ctermfg=176 ctermbg=NONE cterm=NONE guifg=#D18FD8 guibg=NONE gui=NONE
  hi rubyConstant ctermfg=150 ctermbg=NONE cterm=NONE guifg=#9DD18D guibg=NONE gui=NONE
  hi rubyStringDelimiter ctermfg=150 ctermbg=NONE cterm=NONE guifg=#9DD18D guibg=NONE gui=NONE
  hi rubyBlockParameter ctermfg=254 ctermbg=236 cterm=NONE guifg=#DAEAF3 guibg=#17364E gui=NONE
  hi rubyInstanceVariable ctermfg=254 ctermbg=NONE cterm=NONE guifg=#DAEAF3 guibg=NONE gui=NONE
  hi rubyInclude ctermfg=215 ctermbg=NONE cterm=NONE guifg=#F7A865 guibg=NONE gui=NONE
  hi rubyGlobalVariable ctermfg=254 ctermbg=236 cterm=NONE guifg=#DAEAF3 guibg=#17364E gui=NONE
  hi rubyRegexp ctermfg=116 ctermbg=NONE cterm=NONE guifg=#73CBD3 guibg=NONE gui=NONE
  hi rubyRegexpDelimiter ctermfg=116 ctermbg=NONE cterm=NONE guifg=#73CBD3 guibg=NONE gui=NONE
  hi rubyEscape ctermfg=116 ctermbg=NONE cterm=NONE guifg=#73CBD3 guibg=NONE gui=NONE
  hi rubyControl ctermfg=215 ctermbg=NONE cterm=NONE guifg=#F7A865 guibg=NONE gui=NONE
  hi rubyClassVariable ctermfg=254 ctermbg=236 cterm=NONE guifg=#DAEAF3 guibg=#17364E gui=NONE
  hi rubyOperator ctermfg=116 ctermbg=NONE cterm=NONE guifg=#73CBD3 guibg=NONE gui=NONE
  hi rubyException ctermfg=215 ctermbg=NONE cterm=NONE guifg=#F7A865 guibg=NONE gui=NONE
  hi rubyPseudoVariable ctermfg=254 ctermbg=NONE cterm=NONE guifg=#DAEAF3 guibg=NONE gui=NONE
  hi rubyRailsUserClass ctermfg=222 ctermbg=NONE cterm=NONE guifg=#F0D77F guibg=NONE gui=NONE
  hi rubyRailsARAssociationMethod ctermfg=117 ctermbg=NONE cterm=NONE guifg=#7DBDEB guibg=NONE gui=NONE
  hi rubyRailsARMethod ctermfg=117 ctermbg=NONE cterm=NONE guifg=#7DBDEB guibg=NONE gui=NONE
  hi rubyRailsRenderMethod ctermfg=117 ctermbg=NONE cterm=NONE guifg=#7DBDEB guibg=NONE gui=NONE
  hi rubyRailsMethod ctermfg=117 ctermbg=NONE cterm=NONE guifg=#7DBDEB guibg=NONE gui=NONE
  hi erubyDelimiter ctermfg=254 ctermbg=NONE cterm=NONE guifg=#DAEAF3 guibg=NONE gui=NONE
  hi erubyComment ctermfg=110 ctermbg=NONE cterm=NONE guifg=#82A3B8 guibg=NONE gui=italic
  hi erubyRailsMethod ctermfg=117 ctermbg=NONE cterm=NONE guifg=#7DBDEB guibg=NONE gui=NONE
  hi javaScriptRailsFunction ctermfg=117 ctermbg=NONE cterm=NONE guifg=#7DBDEB guibg=NONE gui=NONE
  hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
  hi yamlKey ctermfg=181 ctermbg=NONE cterm=NONE guifg=#E1A0C9 guibg=NONE gui=NONE
  hi yamlAnchor ctermfg=254 ctermbg=236 cterm=NONE guifg=#DAEAF3 guibg=#17364E gui=NONE
  hi yamlAlias ctermfg=254 ctermbg=236 cterm=NONE guifg=#DAEAF3 guibg=#17364E gui=NONE
  hi yamlDocumentHeader ctermfg=150 ctermbg=NONE cterm=NONE guifg=#9DD18D guibg=NONE gui=NONE
  hi cssURL ctermfg=254 ctermbg=236 cterm=NONE guifg=#DAEAF3 guibg=#17364E gui=NONE
  hi cssFunctionName ctermfg=117 ctermbg=NONE cterm=NONE guifg=#7DBDEB guibg=NONE gui=NONE
  hi cssColor ctermfg=176 ctermbg=NONE cterm=NONE guifg=#D18FD8 guibg=NONE gui=NONE
  hi cssPseudoClassId ctermfg=221 ctermbg=NONE cterm=NONE guifg=#F4CF66 guibg=NONE gui=NONE
  hi cssClassName ctermfg=221 ctermbg=NONE cterm=NONE guifg=#F4CF66 guibg=NONE gui=NONE
  hi cssValueLength ctermfg=176 ctermbg=NONE cterm=NONE guifg=#D18FD8 guibg=NONE gui=NONE
  hi cssCommonAttr ctermfg=181 ctermbg=NONE cterm=NONE guifg=#E1A0C9 guibg=NONE gui=NONE
  hi cssBraces ctermfg=254 ctermbg=NONE cterm=NONE guifg=#DAEAF3 guibg=NONE gui=NONE

  " Basic
  hi ColorColumn guifg=NONE guibg=#17364E gui=NONE
  hi Cursor guifg=#071B2C guibg=#EAC779 gui=NONE
  hi CursorColumn guifg=NONE guibg=#10273B gui=NONE
  hi CursorLine guifg=NONE guibg=#10273B gui=NONE
  hi LineNr guifg=#82A3B8 guibg=#071B2C gui=NONE
  hi CursorLineNr guifg=#82A3B8 guibg=#10273B gui=NONE
  hi MatchParen guifg=#F7A865 guibg=NONE gui=underline

  " HTML
  hi htmlTagN guifg=#DAEAF3 guibg=NONE gui=NONE
  hi htmlEndTag guifg=#DAEAF3 guibg=NONE gui=NONE
  hi htmlTagName guifg=#73CBD3 guibg=NONE gui=NONE
  hi htmlArg guifg=#73CBD3 guibg=NONE gui=NONE
  hi htmlSpecialChar guifg=#F7988B guibg=NONE gui=NONE
  hi htmlTitle guifg=NONE guibg=NONE gui=NONE
  hi htmlH1 guifg=NONE guibg=NONE gui=NONE
  hi link htmlH2 htmlH1
  hi link htmlH3 htmlH1
  hi link htmlH4 htmlH1
  hi link htmlH5 htmlH1
  hi link htmlH6 htmlH1
  hi htmlLink guifg=NONE guibg=NONE gui=NONE
  hi htmlSpecialTagName guifg=#F4CF66 guibg=NONE gui=NONE

  " JavaScript
  hi javaScriptFunction guifg=#F271A5 guibg=NONE gui=NONE
  hi javaScriptFuncName guifg=#F271A5 guibg=NONE gui=NONE
  hi javaScriptBraces guifg=#DAEAF3 guibg=NONE gui=NONE

  " Twig
  hi twigTagDelim guifg=NONE guibg=NONE gui=NONE
  hi link twigVarDelim twigTagDelim
  hi twigString guifg=#9DD18D guibg=NONE gui=NONE
  hi twigVariable guifg=#DAEAF3 guibg=NONE gui=NONE
  hi twigBlockName guifg=#DAEAF3 guibg=#17364E gui=NONE


