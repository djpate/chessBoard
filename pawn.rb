class Pawn < Piece

	def can_move?(row, col, piece)

		if piece
			return false if piece.color == color
			possible_col = [@col + 1, @col - 1]
		else
			possible_col = [@col]
		end

		possible_row = color == Piece::WHITE ? [ @row + 1] : [ @row - 1]

		possible_col = Board::sanitize_moves(possible_col)
		possible_row = Board::sanitize_moves(possible_row)

		possible_row.include?(row) && possible_col.include?(col)

	end

end