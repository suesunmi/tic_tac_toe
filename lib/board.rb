class Board
  def initialize
    @grid = Hash.new
    (1..9).each { |key| @grid[key] }
  end
  def retrieve_marker(position)
    if @grid[position].nil? then
      ' '
    else
      @grid[position]
    end
  end
  def display
    "\n1: #{retrieve_marker(1)}   |   2: #{retrieve_marker(2)}   |   3: #{retrieve_marker(3)}\n4: #{retrieve_marker(4)}   |   5: #{retrieve_marker(5)}   |   6: #{retrieve_marker(6)}\n7: #{retrieve_marker(7)}   |   8: #{retrieve_marker(8)}   |   9: #{retrieve_marker(9)}\n"
  end
  def record_play(position, player)
    if position.class == String then
      position = position.to_i
    end
    @grid[position] = player.marker
  end
end
