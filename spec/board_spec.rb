require 'player'
require 'board'
require 'spec_helper.rb'

describe Board do
  before(:each) do
    @player_1 = Player.new("Player A", "X")
    @player_2 = Player.new("Player B", "O")
    @board = Board.new
  end
  it "records the play properly" do
    if @board.mark_position_with_marker(2, @player_1.marker) then
      @board.plays[2].should == @player_1.marker
    end
  end
  it "records the unplayed positions as nil" do
    mark_multiple_positions(@board, Hash[ 1, @player_1.marker, 2, @player_2.marker, 4, @player_2.marker, 5, @player_2.marker, 6, @player_1.marker, 7, @player_1.marker ] )
    @board.unplayed_positions.should == [ 3, 8, 9 ]
  end
  it "displays the score accurately" do
    if @board.mark_position_with_marker(4, @player_2.marker) then
      @board.display.should == "\n1:     |   2:     |   3:  \n4: #{@player_2.marker}   |   5:     |   6:  \n7:     |   8:     |   9:  \n"
    end
  end
  it "ignores random play inputs" do
    @board.mark_position_with_marker('dunno', @player_1.marker).should == false
  end
  it "does not record a winner after only 2 plays" do
    @board.mark_position_with_marker(2, @player_1.marker)
    @board.mark_position_with_marker(5, @player_2.marker)
    @board.winner.should == ""
  end
  it "records a winner" do
    mark_multiple_positions(@board, Hash[ 2, @player_1.marker, 5, @player_2.marker, 3, @player_1.marker, 6, @player_2.marker, 1, @player_1.marker ] )
    @board.winner.should_not be_nil
  end
  it "transfers all the info from another board object" do
    mark_multiple_positions(@board, Hash[ 3, @player_1.marker, 2, @player_2.marker, 6, @player_1.marker, 5, @player_2.marker, 9, @player_1.marker ] )
    other_board = Board.new
    other_board.update(@board)
    other_board.plays.should == @board.plays
    other_board.winner.should == @board.winner
  end
  it "recognizes opponent" do
    mark_multiple_positions(@board, Hash[ 2, @player_1.marker, 5, @player_2.marker, 3, @player_1.marker, 6, @player_2.marker, 1, @player_1.marker ] )
    @board.opponent("X").should == "O"
  end
end
