class Game
  def initialize( player_1, player_2)
    @board = Hash.new
    (1..9).each { |key| @board[key] = ' ' }
    @player_1 = player_1
    @player_1.marker = 'X'
    @player_2 = player_2
    @player_2.marker = 'O'
    @current_player = @player_1
    @current_play = 0
  end
  attr_reader :board, :player_1, :player_2, :current_player
  def display_board
    "\n1: #{@board[1]}   |   2: #{@board[2]}   |   3: #{@board[3]}\n4: #{@board[4]}   |   5: #{@board[5]}   |   6: #{@board[6]}\n7: #{@board[7]}   |   8: #{@board[8]}   |   9: #{@board[9]}\n"
  end
  def is_not_over
    @current_play < 9
  end
  def next_play(position)
    mark_position_with(position, @current_player.marker)
    toggle_player
    @current_play += 1
  end
  def mark_position_with(position,marker)
    if position.class == String then
      position = position.to_i
    end
    @board[position] = marker
  end
  def toggle_player
    if @current_player == @player_1 then
      @current_player = player_2
    elsif @current_player == @player_2 then
      @current_player = player_1
    end
  end
end

class Player
  def initialize(name)
    @name = name
    @marker
  end
  attr_accessor :name, :marker
end
