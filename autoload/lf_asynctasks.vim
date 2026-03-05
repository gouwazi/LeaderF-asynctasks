" ============================================================================
" FileName: lf_asynctasks.vim
" Author: gouwazi <assheadlld@gmail.com>
" GitHub: https://github.com/gouwazi
" ============================================================================

let s:sep = "\t"

function! lf_asynctasks#source(...)
	let candidates = []
	let tasks = asynctasks#list('')
	for task in tasks
		let name = task['name']
		let command = task['command']
		let scope = task['scope']
		let source = task['source']
		call add(candidates, join([name, command, scope, source], s:sep))
	endfor
	return candidates
endfunction

function! lf_asynctasks#accept(line, arg) abort
	let parts = split(a:line, s:sep, 1)
	let name = get(parts, 0, '')
	if !empty(name)
		call asynctasks#cmd('<bang>', name)
	endif
endfunction

function! lf_asynctasks#preview(orig_buf_nr, orig_cursor, line, args) abort
	let parts = split(a:line, s:sep, 1)
	let file = get(parts, 3, '')
	return [file, 1, '']
endfunction

function! lf_asynctasks#digest(line, mode)
	let parts = split(a:line, s:sep, 1)
	let name = get(parts, 0, '')
	return [name, 0]
endfunc

