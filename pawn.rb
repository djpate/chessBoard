class Pawn < Piece

	def can_move?(row, col, piece)

		if piece
			possible_col = [@col + 1, @col - 1]
		else
			possible_col = [@col]
		end

		possible_row = color == Piece::WHITE ? [ @row + 1] : [ @row - 1]

		puts possible_col

		possible_col = sanitize_moves(possible_col)
		possible_row = sanitize_moves(possible_row)

		possible_row.include?(row) && possible_col.include?(col)

	end

end