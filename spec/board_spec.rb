require './board.rb'
require './piece.rb'
require './pawn.rb'

describe "Board" do 
	
	it "should create a proper matrix" do
		b = Board.new
		b.matrix.length.should == Board::ROW
		b.matrix[0].length.should == Board::COL
	end

	it "should let you fetch a piece" do
		b = Board.new
		piece = b.piece(1,0)
		piece.should_not be_nil
		piece.row.should == 1
		piece.col.should == 0
	end

	it "should return nil when there is no piece" do
		b = Board.new
		piece = b.piece(0,0)
		piece.should be_nil
	end

	it "should let you move a piece to an empty spot" do
		b = Board.new
		b.move(1,0,2,0)
		b.matrix[1][0].should be_nil
		b.matrix[2][0].should_not be_nil
		b.matrix[2][0].row.should == 2
		b.matrix[2][0].col.should == 0
	end

	it "should let you move a piece to a taken spot and add the piece to the dead piece array" do
		b = Board.new
		b.move(1,0,6,0)
		b.dead_pieces.length.should == 1
	end

	it "shouldnt let you move outside of the board" do
		Board::sanitize_moves((-1..9).to_a).length.should == 8 
	end
end