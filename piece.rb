class Piece

	WHITE = "W"
	BLACK = "B"

	attr_reader :color
	attr_accessor :row, :col

	def initialize(row, col, color)
		@row = row
		@col = col
		@color = color
	end

	def can_move?(row, col)
		raise "you must implement this in the child class"
	end

	def to_s
		"#{self.class.name[0]}#{@color[0]}"
	end

end