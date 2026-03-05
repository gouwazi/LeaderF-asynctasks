" ============================================================================
" FileName: lf_asynctasks.vim
" Author: gouwazi <assheadlld@gmail.com>
" GitHub: https://github.com/gouwazi
" ============================================================================

let g:Lf_Extensions = get(g:, 'Lf_Extensions', {})
let g:Lf_Extensions.asynctasks = {
  \ 'source': string(function('lf_asynctasks#source'))[10:-3],
  \ 'accept': string(function('lf_asynctasks#accept'))[10:-3],
  \ 'preview': string(function('lf_asynctasks#preview'))[10:-3],
  \ 'get_digest': string(function('lf_asynctasks#digest'))[10:-3],
  \ }

