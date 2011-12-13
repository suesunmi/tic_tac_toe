require_relative 'board'

class Game
  attr_reader :board, :player_1, :player_2, :current_player, :winner
  def initialize( player_1, player_2)
    @board = Board.new
    @player_1 = player_1
    @player_2 = player_2
    @current_player = @player_1
    @current_play = 0
  end
  def over?
    return true if @board.winner.empty? == false
    return true if @current_play >= 9
  end
  def next_play(position)
    if @board.mark_position_with_marker(position, @current_player.marker)
      toggle_player
      @current_play += 1
    end
  end
  def toggle_player
    if @current_player == @player_1 then
      @current_player = @player_2
    elsif @current_player == @player_2 then
      @current_player = @player_1
    end
  end
end
