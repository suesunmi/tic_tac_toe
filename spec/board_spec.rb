require 'player'
require 'board'

describe Board do
  before(:each) do
    @player_1 = Player.new("Player A", "X")
    @player_2 = Player.new("Player B", "O")
    @board = Board.new
  end
  it "records the play properly" do
    @board.record_play(2, @player_1)
    @board.plays[2].marker.should == @player_1.marker
  end
  it "displays the score accurately" do
    @board.record_play(4, @player_2)
    @board.display.should == "\n1:     |   2:     |   3:  \n4: #{@player_2.marker}   |   5:     |   6:  \n7:     |   8:     |   9:  \n"
  end
end
