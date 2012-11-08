require './board.rb'
require './piece.rb'
require './pawn.rb'

describe "Pawn" do 

	it "should only let you move forward on an empty cell" do
		p = Pawn.new(1,0, Piece::WHITE)
		p.can_move?(2,0, nil).should be_true

		p = Pawn.new(1,0, Piece::WHITE)
		p.can_move?(2,1, nil).should be_false

		p = Pawn.new(2,0, Piece::WHITE)
		p.can_move?(1,0, nil).should be_false
	end
	
	it "should let eat you diagonaly" do
		p = Pawn.new(1,0, Piece::WHITE)
		p.can_move?(2,1, Pawn.new(2,1, Piece::BLACK)).should be_true

		p = Pawn.new(1,1, Piece::WHITE)
		p.can_move?(2,0, Pawn.new(2,0, Piece::BLACK)).should be_true
	end

	it "should not let eat you a same color piece" do
		p = Pawn.new(1,0, Piece::WHITE)
		p.can_move?(2,1, Pawn.new(2,1, Piece::WHITE)).should be_false
	end
	
end