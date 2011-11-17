require_relative 'player'
require_relative 'board'

class Game
  attr_reader :board, :player_1, :player_2, :current_player, :winner
  def initialize( player_1, player_2)
    @board = Board.new
    @player_1 = player_1
    @player_2 = player_2
    @current_player = @player_1
    @current_play = 0
    @winner
  end
  def over?
    calculate_score
    return true if @winner
    @current_play >= 9
  end
  def next_play(position)
    @board.record_play(position, @current_player)
    toggle_player
    @current_play += 1
  end
  def toggle_player
    if @current_player == @player_1 then
      @current_player = player_2
    elsif @current_player == @player_2 then
      @current_player = player_1
    end
  end
  def calculate_score

  end
end
