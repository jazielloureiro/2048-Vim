function! s:main()
	call s:createBuffer()

	let l:board = s:createBoard()

	call s:drawBoardStructure()
	call s:drawBoard(l:board)
	call getchar()

	bdelete!
endfunction

function! s:createBuffer()
	if filewritable(expand('%'))
		write
	endif

	edit! 2048
endfunction

function! s:createBoard()
	const l:boardSize = 3

	let l:cols = []
	for l:i in range(0, l:boardSize)
		let l:cols += [0]
	endfor

	let l:board = []
	for l:i in range(0, l:boardSize)
		let l:board += [[]]
		let l:board[l:i] = copy(l:cols)
	endfor

	return l:board
endfunction

function! s:drawBoardStructure()
	call setline(1, "╔══════╦══════╦══════╦══════╗")
	call setline(2, "║      ║      ║      ║      ║")
	call setline(3, "╠══════╬══════╬══════╬══════╣")
	call setline(4, "║      ║      ║      ║      ║")
	call setline(5, "╠══════╬══════╬══════╬══════╣")
	call setline(6, "║      ║      ║      ║      ║")
	call setline(7, "╠══════╬══════╬══════╬══════╣")
	call setline(8, "║      ║      ║      ║      ║")
	call setline(9, "╚══════╩══════╩══════╩══════╝")
endfunction

function! s:drawBoard(board)
	for [l:i, l:j] in [[0, 2], [1, 4], [2, 6], [3, 8]]
		let l:line = "║ "

		for l:k in range(4)
			if a:board[l:i][l:k] != 0
				let l:line .= printf("%4d", a:board[l:i][l:k]) . " ║ "
			else
				let l:line .= "    " . " ║ "
			endif
		endfor

		call setline(l:j, l:line)
	endfor

	redraw
endfunction

call s:main()
