" Define syntax matching
syntax region zoiaHeader        start=/\v\\header\[/ end=/\v\]/
" This checks that you don't use a nonexistent header kind
syntax match zoiaHeaderKindOk   /\v(aliases|chapter|dictionary|fragment)/ containedin=zoiaHeader contained
syntax match zoiaHeaderKindErr  /\v(\[)@<=[^\]]+(\])@=(aliases|chapter|dictionary|fragment)@<!/ containedin=zoiaHeader contained

syntax match zoiaAlias          /\v\@(\a|\d)+/
syntax match zoiaCommand        /\v\\(header)@!(\\|[^ \r\n@\\|[\];=*#]+)/

syntax match zoiaSpecialChars   /\v[|[\]=]/

syntax region zoiaEm1           start=/\v\*/ end=/\v\*/ contains=zoiaAlias,zoiaCommand,zoiaSpecialChars
syntax region zoiaEm2           start=/\v\*\*/ end=/\v\*\*/ contains=zoiaAlias,zoiaCommand,zoiaSpecialChars
syntax region zoiaEm3           start=/\v\*\*\*/ end=/\v\*\*\*/ contains=zoiaAlias,zoiaCommand,zoiaSpecialChars

syntax match zoiaDialogue       /\v"[^"]+"/ contains=zoiaAlias,zoiaCommand,zoiaSpecialChars,zoiaEm1,zoiaEm2,zoiaEm3
syntax region zoiaDialogueML    start=/\v"""/ end=/\v"""/ contains=zoiaAlias,zoiaCommand,zoiaSpecialChars,zoiaEm1,zoiaEm2,zoiaEm3

syntax keyword zoiaTodo         TODO FIXME XXX
syntax match zoiaComment        /\v#.*$/ contains=zoiaTodo

" Setup highlighting
highlight default link zoiaHeader           Header
highlight Header ctermfg=blue cterm=bold
highlight default link zoiaHeaderKindOk     HeaderKindOk
highlight HeaderKindOk ctermfg=green
highlight default link zoiaHeaderKindErr    HeaderKindErr
highlight HeaderKindErr ctermfg=red cterm=underline

highlight default link zoiaAlias            Identifier
highlight default link zoiaCommand          Keyword

highlight default link zoiaSpecialChars     Keyword

highlight default link zoiaEm1              Italics
highlight Italics cterm=italic
highlight default link zoiaEm2              Bold
highlight Bold cterm=bold
highlight default link zoiaEm3              BoldItalics
highlight BoldItalics cterm=bold,italic

highlight default link zoiaDialogue         String
highlight default link zoiaDialogueML       String

highlight default link zoiaTodo             Todo
highlight default link zoiaComment          Comment
