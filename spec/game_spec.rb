require './game.rb'
require './board.rb'
require './piece.rb'
require './pawn.rb'

describe "Game" do
	
	it "should start with white" do
		g = Game.new
		g.current_player.should == Piece::WHITE
	end

	it "should detect wrong coords" do
		g = Game.new
		lambda{g.execute_move("654654")}.should raise_exception(Exception, 'Move not understood')
		lambda{g.execute_move("6946")}.should raise_exception(Exception, 'Move not understood')
	end

	it "should detect same position" do
		g = Game.new
		lambda{g.execute_move("6565")}.should raise_exception(Exception, "You're not moving anything")
	end

	it "should detect when empty cell" do
		g = Game.new
		lambda{g.execute_move("4546")}.should raise_exception(Exception, "There is no piece to move here")
	end

	it "should detect when you try to move a piece that's not yours" do
		g = Game.new
		lambda{g.execute_move("6546")}.should raise_exception(Exception, "This is not your piece")
	end

	it "should detect a bad mouvement" do
		g = Game.new
		lambda{g.execute_move("1015")}.should raise_exception(Exception, "You cannot move there!")
	end

	it "should change board on valid move" do
		g = Game.new
		g.execute_move("1020")
		g.board.piece(2,0).should_not be_nil
	end

	it "should alter player on valid move" do
		g = Game.new
		g.execute_move("1020")
		g.current_player.should == Piece::BLACK
	end
end