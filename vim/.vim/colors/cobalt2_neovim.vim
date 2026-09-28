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

  hi Visual ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#205276 gui=NONE
  hi VertSplit ctermfg=239 ctermbg=239 cterm=NONE guifg=#2C506D guibg=#2C506D gui=NONE
  hi StatusLine ctermfg=231 ctermbg=24 cterm=bold guifg=#FFFFFF guibg=#205276 gui=bold
  hi StatusLineNC ctermfg=231 ctermbg=236 cterm=NONE guifg=#FFFFFF guibg=#102E48 gui=NONE
  hi Pmenu ctermfg=220 ctermbg=NONE cterm=NONE guifg=#FFC600 guibg=NONE gui=NONE
  hi PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#205276 gui=NONE
  hi IncSearch ctermfg=235 ctermbg=76 cterm=NONE guifg=#072539 guibg=#3AD900 gui=NONE
  hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
  hi Directory ctermfg=39 ctermbg=NONE cterm=NONE guifg=#00AAFF guibg=NONE gui=NONE
  hi Folded ctermfg=103 ctermbg=235 cterm=NONE guifg=#7797B3 guibg=#072539 gui=NONE

  hi Normal ctermfg=231 ctermbg=235 cterm=NONE guifg=#FFFFFF guibg=#072539 gui=NONE
  hi Boolean ctermfg=204 ctermbg=NONE cterm=NONE guifg=#FF628C guibg=NONE gui=NONE
  hi Character ctermfg=204 ctermbg=NONE cterm=NONE guifg=#FF628C guibg=NONE gui=NONE
  hi Comment ctermfg=33 ctermbg=NONE cterm=NONE guifg=#0088FF guibg=NONE gui=italic
  hi Conditional ctermfg=214 ctermbg=NONE cterm=NONE guifg=#FF9D00 guibg=NONE gui=NONE
  hi Constant ctermfg=204 ctermbg=NONE cterm=NONE guifg=#FF628C guibg=NONE gui=NONE
  hi Define ctermfg=214 ctermbg=NONE cterm=NONE guifg=#FF9D00 guibg=NONE gui=NONE
  hi DiffAdd ctermfg=231 ctermbg=236 cterm=bold guifg=#FFFFFF guibg=#23422F gui=bold
  hi DiffDelete ctermfg=203 ctermbg=NONE cterm=NONE guifg=#FF4F70 guibg=NONE gui=NONE
  hi DiffChange ctermfg=231 ctermbg=23 cterm=NONE guifg=#FFFFFF guibg=#17445F gui=NONE
  hi DiffText ctermfg=231 ctermbg=24 cterm=bold guifg=#FFFFFF guibg=#205276 gui=bold
  hi ErrorMsg ctermfg=231 ctermbg=237 cterm=NONE guifg=#FFFFFF guibg=#4A2739 gui=NONE
  hi WarningMsg ctermfg=231 ctermbg=236 cterm=NONE guifg=#FFFFFF guibg=#49351F gui=NONE
  hi Float ctermfg=204 ctermbg=NONE cterm=NONE guifg=#FF628C guibg=NONE gui=NONE
  hi Function ctermfg=220 ctermbg=NONE cterm=NONE guifg=#FFC600 guibg=NONE gui=NONE
  hi Identifier ctermfg=213 ctermbg=NONE cterm=NONE guifg=#FB94FF guibg=NONE gui=NONE
  hi Keyword ctermfg=214 ctermbg=NONE cterm=NONE guifg=#FF9D00 guibg=NONE gui=NONE
  hi Label ctermfg=76 ctermbg=NONE cterm=NONE guifg=#3AD900 guibg=NONE gui=NONE
  hi NonText ctermfg=220 ctermbg=236 cterm=NONE guifg=#FFC600 guibg=#102E48 gui=NONE
  hi Number ctermfg=204 ctermbg=NONE cterm=NONE guifg=#FF628C guibg=NONE gui=NONE
  hi Operator ctermfg=231 ctermbg=NONE cterm=NONE guifg=#F8F8F8 guibg=NONE gui=NONE
  hi PreProc ctermfg=214 ctermbg=NONE cterm=NONE guifg=#FF9D00 guibg=NONE gui=NONE
  hi Special ctermfg=37 ctermbg=NONE cterm=NONE guifg=#06A6A8 guibg=NONE gui=NONE
  hi SpecialKey ctermfg=220 ctermbg=23 cterm=NONE guifg=#FFC600 guibg=#173C57 gui=NONE
  hi Statement ctermfg=214 ctermbg=NONE cterm=NONE guifg=#FF9D00 guibg=NONE gui=NONE
  hi StorageClass ctermfg=214 ctermbg=NONE cterm=NONE guifg=#FF9D00 guibg=NONE gui=NONE
  hi String ctermfg=76 ctermbg=NONE cterm=NONE guifg=#3AD900 guibg=NONE gui=NONE
  hi Tag ctermfg=220 ctermbg=NONE cterm=NONE guifg=#FFDD00 guibg=NONE gui=NONE
  hi Title ctermfg=231 ctermbg=NONE cterm=bold guifg=#FFFFFF guibg=NONE gui=bold
  hi Todo ctermfg=33 ctermbg=NONE cterm=inverse,bold guifg=#0088FF guibg=NONE gui=inverse,bold,italic
  hi Type ctermfg=220 ctermbg=NONE cterm=NONE guifg=#FFDD00 guibg=NONE gui=NONE
  hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
  hi rubyClass ctermfg=180 ctermbg=NONE cterm=NONE guifg=#D7BA7D guibg=NONE gui=NONE
  hi rubyFunction ctermfg=197 ctermbg=NONE cterm=NONE guifg=#F92672 guibg=NONE gui=NONE
  hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
  hi rubySymbol ctermfg=204 ctermbg=NONE cterm=NONE guifg=#FF628C guibg=NONE gui=NONE
  hi rubyConstant ctermfg=76 ctermbg=NONE cterm=NONE guifg=#3AD900 guibg=NONE gui=NONE
  hi rubyStringDelimiter ctermfg=76 ctermbg=NONE cterm=NONE guifg=#3AD900 guibg=NONE gui=NONE
  hi rubyBlockParameter ctermfg=217 ctermbg=23 cterm=NONE guifg=#F4ABA4 guibg=#173C57 gui=NONE
  hi rubyInstanceVariable ctermfg=213 ctermbg=NONE cterm=NONE guifg=#FB94FF guibg=NONE gui=NONE
  hi rubyInclude ctermfg=214 ctermbg=NONE cterm=NONE guifg=#FF9D00 guibg=NONE gui=NONE
  hi rubyGlobalVariable ctermfg=213 ctermbg=23 cterm=NONE guifg=#FB94FF guibg=#173C57 gui=NONE
  hi rubyRegexp ctermfg=37 ctermbg=NONE cterm=NONE guifg=#06A6A8 guibg=NONE gui=NONE
  hi rubyRegexpDelimiter ctermfg=37 ctermbg=NONE cterm=NONE guifg=#06A6A8 guibg=NONE gui=NONE
  hi rubyEscape ctermfg=37 ctermbg=NONE cterm=NONE guifg=#06A6A8 guibg=NONE gui=NONE
  hi rubyControl ctermfg=214 ctermbg=NONE cterm=NONE guifg=#FF9D00 guibg=NONE gui=NONE
  hi rubyClassVariable ctermfg=213 ctermbg=23 cterm=NONE guifg=#FB94FF guibg=#173C57 gui=NONE
  hi rubyOperator ctermfg=231 ctermbg=NONE cterm=NONE guifg=#F8F8F8 guibg=NONE gui=NONE
  hi rubyException ctermfg=214 ctermbg=NONE cterm=NONE guifg=#FF9D00 guibg=NONE gui=NONE
  hi rubyPseudoVariable ctermfg=231 ctermbg=NONE cterm=NONE guifg=#FFFFFF guibg=NONE gui=NONE
  hi rubyRailsUserClass ctermfg=180 ctermbg=NONE cterm=NONE guifg=#D7BA7D guibg=NONE gui=NONE
  hi rubyRailsARAssociationMethod ctermfg=220 ctermbg=NONE cterm=NONE guifg=#FFC600 guibg=NONE gui=NONE
  hi rubyRailsARMethod ctermfg=220 ctermbg=NONE cterm=NONE guifg=#FFC600 guibg=NONE gui=NONE
  hi rubyRailsRenderMethod ctermfg=220 ctermbg=NONE cterm=NONE guifg=#FFC600 guibg=NONE gui=NONE
  hi rubyRailsMethod ctermfg=220 ctermbg=NONE cterm=NONE guifg=#FFC600 guibg=NONE gui=NONE
  hi erubyDelimiter ctermfg=231 ctermbg=NONE cterm=NONE guifg=#FFFFFF guibg=NONE gui=NONE
  hi erubyComment ctermfg=33 ctermbg=NONE cterm=NONE guifg=#0088FF guibg=NONE gui=italic
  hi erubyRailsMethod ctermfg=220 ctermbg=NONE cterm=NONE guifg=#FFC600 guibg=NONE gui=NONE
  hi javaScriptRailsFunction ctermfg=220 ctermbg=NONE cterm=NONE guifg=#FFC600 guibg=NONE gui=NONE
  hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
  hi yamlKey ctermfg=203 ctermbg=NONE cterm=NONE guifg=#EC5F67 guibg=NONE gui=NONE
  hi yamlAnchor ctermfg=231 ctermbg=23 cterm=NONE guifg=#FFFFFF guibg=#173C57 gui=NONE
  hi yamlAlias ctermfg=231 ctermbg=23 cterm=NONE guifg=#FFFFFF guibg=#173C57 gui=NONE
  hi yamlDocumentHeader ctermfg=76 ctermbg=NONE cterm=NONE guifg=#3AD900 guibg=NONE gui=NONE
  hi cssURL ctermfg=231 ctermbg=23 cterm=NONE guifg=#FFFFFF guibg=#173C57 gui=NONE
  hi cssFunctionName ctermfg=220 ctermbg=NONE cterm=NONE guifg=#FFC600 guibg=NONE gui=NONE
  hi cssColor ctermfg=204 ctermbg=NONE cterm=NONE guifg=#FF628C guibg=NONE gui=NONE
  hi cssPseudoClassId ctermfg=220 ctermbg=NONE cterm=NONE guifg=#FFDD00 guibg=NONE gui=NONE
  hi cssClassName ctermfg=220 ctermbg=NONE cterm=NONE guifg=#FFDD00 guibg=NONE gui=NONE
  hi cssValueLength ctermfg=204 ctermbg=NONE cterm=NONE guifg=#FF628C guibg=NONE gui=NONE
  hi cssCommonAttr ctermfg=213 ctermbg=NONE cterm=NONE guifg=#FB94FF guibg=NONE gui=NONE
  hi cssBraces ctermfg=231 ctermbg=NONE cterm=NONE guifg=#FFFFFF guibg=NONE gui=NONE

  " Basic
  hi ColorColumn guifg=NONE guibg=#173C57 gui=NONE
  hi Cursor guifg=#072539 guibg=#FFC600 gui=NONE
  hi CursorColumn guifg=NONE guibg=#0C2F49 gui=NONE
  hi CursorLine guifg=NONE guibg=#0C2F49 gui=NONE
  hi LineNr guifg=#7797B3 guibg=#072539 gui=NONE
  hi CursorLineNr guifg=#7797B3 guibg=#0C2F49 gui=NONE
  hi MatchParen guifg=#FF9D00 guibg=NONE gui=underline

  " HTML
  hi htmlTagN guifg=#FFFFFF guibg=NONE gui=NONE
  hi htmlEndTag guifg=#FFFFFF guibg=NONE gui=NONE
  hi htmlTagName guifg=#EC5F67 guibg=NONE gui=NONE
  hi htmlArg guifg=#FD971F guibg=NONE gui=NONE
  hi htmlSpecialChar guifg=#FF628C guibg=NONE gui=NONE
  hi htmlTitle guifg=NONE guibg=NONE gui=NONE
  hi htmlH1 guifg=NONE guibg=NONE gui=NONE
  hi link htmlH2 htmlH1
  hi link htmlH3 htmlH1
  hi link htmlH4 htmlH1
  hi link htmlH5 htmlH1
  hi link htmlH6 htmlH1
  hi htmlLink guifg=NONE guibg=NONE gui=NONE
  hi htmlSpecialTagName guifg=#FFDD00 guibg=NONE gui=NONE

  " JavaScript
  hi javaScriptFunction guifg=#F92672 guibg=NONE gui=NONE
  hi javaScriptFuncName guifg=#F92672 guibg=NONE gui=NONE
  hi javaScriptBraces guifg=#FFFFFF guibg=NONE gui=NONE

  " Twig
  hi twigTagDelim guifg=NONE guibg=NONE gui=NONE
  hi link twigVarDelim twigTagDelim
  hi twigString guifg=#3AD900 guibg=NONE gui=NONE
  hi twigVariable guifg=#FFFFFF guibg=NONE gui=NONE
  hi twigBlockName guifg=#FFFFFF guibg=#173C57 gui=NONE


