class Game

	attr_reader :current_player, :board

	def initialize
		@board = Board.new
		@current_player = Piece::WHITE
	end

	def launch
		@playing = true
		while @playing
			@board.display
			puts "Player #{@current_player} : What's your move ? (eg. 0103)"
			begin
				execute_move(gets)
			rescue => e
				puts e.message
			end
		end
	end

	def execute_move(coords)
		
		coords = coords.strip.split('').reject{|c| c.to_i < 0 or c.to_i > 7}
		raise 'Move not understood' unless coords.length == 4

		current_row = coords[0].to_i
		current_col = coords[1].to_i
		desired_row = coords[2].to_i
		desired_col = coords[3].to_i

		raise "You're not moving anything" unless current_row != desired_row || current_col != desired_col

		piece = @board.piece(current_row, current_col)

		raise 'There is no piece to move here' unless piece
		raise 'This is not your piece' unless piece.color == @current_player
		raise 'You cannot move there!' unless piece.can_move?(desired_row, desired_col, @board.piece(desired_row, desired_col))

		@board.move(current_row, current_col, desired_row, desired_col)
		@current_player = @current_player == Piece::WHITE ? Piece::BLACK : Piece::WHITE;

	end

end
