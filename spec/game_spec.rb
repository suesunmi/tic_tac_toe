require 'game'

describe Game do
  before(:each) do
    @player_1 = Player.new("Player A")
    @player_2 = Player.new("Player B")
    @game = Game.new(@player_1, @player_2)
  end
  it "records the play properly" do
    @game.mark_position_with(2, @player_1.marker)
    @game.board[2].should == @player_1.marker
  end
  it "displays the score accurately" do
    @game.mark_position_with(4, @player_2.marker)
    @game.display_board.should == "\n1:     |   2:     |   3:  \n4: #{@player_2.marker}   |   5:     |   6:  \n7:     |   8:     |   9:  \n"
  end
  it "toggles to Player B after the first play" do
    @game.next_play(1)
    @game.current_player.name.should == "Player B"
  end
end
