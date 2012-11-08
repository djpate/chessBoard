require './board.rb'
require './piece.rb'
require './pawn.rb'

describe "Piece" do 
	
	it "should abstract the can_move? method" do
		p = Piece.new(1,2,Piece::WHITE)
		lambda{p.can_move?(1,2)}.should raise_exception
	end

end