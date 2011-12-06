require 'player'
require 'board'

describe Player do
  it "recognizes its opponent on the board" do
    this_is_me = Player.new("Me", "X")
    this_is_him = Player.new("The Other Guy", "O")
    board = Board.new
    board.mark_position_with_marker(1, this_is_me.marker)
    board.mark_position_with_marker(2, this_is_him.marker)
    this_is_me.my_opponents_mark(board).should == this_is_him.marker
  end
end
