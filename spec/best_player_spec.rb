require 'player'
require 'best_player'
require 'board'
require_relative 'spec_helper'

describe BestPlayer do
  before(:each) do
    @board = Board.new
    @computer = BestPlayer.new("Computer", "X")
    @human = Player.new("Human", "O")
  end
  it "blocks opponent from winning 3 plays left - i" do
#1: X   |   2: O   |   3: X
#4: O   |   5: O   |   6:
#7:     |   8: X   |   9:
    mark_multiple_positions(@board, Hash[ 1, @computer.marker, 5, @human.marker, 3, @computer.marker, 2, @human.marker, 8, @computer.marker, 4, @human.marker ] )
    @computer.decide_next_move(@board).should == 6
  end
  it "blocks opponent from winning with 3 plays left - ii" do
# 1: X   |   2: O   |   3:
# 4: O   |   5: O   |   6: X
# 7: X   |   8:     |   9:
    mark_multiple_positions(@board, Hash[ 1, @computer.marker, 2, @human.marker, 4, @human.marker, 5, @human.marker, 6, @computer.marker, 7, @computer.marker ] )
    @computer.decide_next_move(@board).should == 8
  end
  it "blocks opponent from winning 5 plays left - i" do
#1: X   |   2: O   |   3: X
#4:     |   5: O   |   6:
#7:     |   8:     |   9:
    mark_multiple_positions(@board, Hash[ 1, @computer.marker, 5, @human.marker, 3, @computer.marker, 2, @human.marker ] )
    @computer.decide_next_move(@board).should == 8
  end
  it "blocks opponent from winning with 5 plays left - ii" do
#1:     |   2:     |   3: X
#4:     |   5: O   |   6: O
#7:     |   8:     |   9: X
    mark_multiple_positions(@board, Hash[ 3, @computer.marker, 5, @human.marker, 9, @computer.marker, 6, @human.marker ] )
    @computer.decide_next_move(@board).should == 4
  end
  it "chooses to win rather than block opponent - i" do
#1: X   |   2: O   |   3:
#4: X   |   5: O   |   6:
#7:     |   8:     |   9:
    mark_multiple_positions(@board, Hash[ 1, @computer.marker, 2, @human.marker, 4, @computer.marker, 5, @human.marker ] )
    @computer.decide_next_move(@board).should == 7
  end
  it "chooses to win rather than block opponent - ii" do
#1:     |   2: O   |   3: X
#4:     |   5: O   |   6: X
#7:     |   8:     |   9:
    mark_multiple_positions(@board, Hash[ 3, @computer.marker, 2, @human.marker, 6, @computer.marker, 5, @human.marker ] )
    @computer.decide_next_move(@board).should == 9
  end
end
