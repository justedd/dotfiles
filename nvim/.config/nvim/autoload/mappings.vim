set hlsearch
let g:search_highlighted = 0

function! mappings#cycle_highlight()
  if g:search_highlighted
    let @/=""
    let g:search_highlighted = 0
  else
    execute "normal \<Plug>(asterisk-z*)"
    let g:search_highlighted = 1
  end
endfunction
