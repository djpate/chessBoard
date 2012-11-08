class Board

	ROW = 8
	COL = 8

	def initialize
		
		create_matrix	
		initial_pieces
		@dead_pieces = []

	end

	def display
		
		print "[--]"
		COL.times do |col|
			print "[ #{col}]"
		end
		puts
		
		ROW.times do |row|
			print "[ #{row}]"
			COL.times do |col|
				if @matrix[row][col]
					print "[#{@matrix[row][col]}]"
				else
					print "[  ]"
				end
			end
			puts
		end

		unless @dead_pieces.empty?
			puts "Captured Pieces : #{@dead_pieces.join(',')}"
		end
	end

	def piece(row, col)
		@matrix[row][col]
	end

	def move(row, col, new_row, new_col)
		
		piece = piece(row,col)
		piece.row = new_row
		piece.col = new_col

		old_piece = piece(new_row, new_col) 
		@dead_pieces.push(old_piece) if old_piece
		@matrix[row][col] = nil

		@matrix[new_row][new_col] = piece

	end

	private

	def create_matrix
		@matrix = []
		ROW.times do |row|
			@matrix[row] = []
			COL.times do |col|
				@matrix[row][col] = nil;
			end
		end
	end

	def initial_pieces
		#doing only pawns here
		16.times do |i|
			if(i < 8)
				row = 1
				col = i
				color = Piece::WHITE
			else
				row = 6
				col = i - 8
				color = Piece::BLACK
			end
			@matrix[row][col] = Pawn.new(row, col, color)
		end
	end
end