require 'player'
require 'game'

describe Game do
  before(:each) do
    @player_1 = Player.new("Player A", "X")
    @player_2 = Player.new("Player B", "O")
    @game = Game.new(@player_1, @player_2)
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
  it "doesn't overwrite already-made plays" do
    first_player = @game.current_player
    @game.next_play(7)
    @game.next_play(7)
    @game.board.plays[7] == first_player.marker
  end
  it "advances game correctly when input is nothing" do
#    first_player = @game.current_player
#    @game.next_play()  WHERE SHOULD I TRAP FOR NUMBER OF ARGS ERROR?
#    @game.current_player.should == first_player
  end
  it "advances game correctly when input is random" do
    first_player = @game.current_player
    @game.next_play('dunno')
    @game.current_player.should == first_player
  end
end
