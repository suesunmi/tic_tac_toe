require 'game'

describe Game do
  before(:each) do
    @player_1 = Player.new("Player A", "X")
    @player_2 = Player.new("Player B", "O")
    @game = Game.new(@player_1, @player_2)
  end
  it "records the play properly" do
    @game.board.record_play(2, @player_1)
    @game.board.plays[2].marker.should == @player_1.marker
  end
  it "displays the score accurately" do
    @game.board.record_play(4, @player_2)
    @game.board.display.should == "\n1:     |   2:     |   3:  \n4: #{@player_2.marker}   |   5:     |   6:  \n7:     |   8:     |   9:  \n"
  end
  it "toggles to Player B after the first play" do
    @game.next_play(1)
    @game.current_player.name.should == "Player B"
  end
  it "makes sure game is not over after just 3 plays" do
    @game.next_play(2)
    @game.next_play(5)
    @game.next_play(8)
    @game.should_not be_over
  end
  it "doesn't overwrite already-made plays"
  it "advances game correctly when input is nothing"
  it "advances game correctly when input is random"
end
