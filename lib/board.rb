class Board
  attr_reader :plays, :winner
  def initialize
    @plays = Hash.new
    (1..9).each { |key| @plays[key] = nil }
    @combos = [ [1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7] ]
    @winner
  end
  def retrieve_marker(position)
    if @plays[position].nil? then
      ' '
    else
      @plays[position]
    end
  end
  def display
    "\n1: #{retrieve_marker(1)}   |   2: #{retrieve_marker(2)}   |   3: #{retrieve_marker(3)}\n4: #{retrieve_marker(4)}   |   5: #{retrieve_marker(5)}   |   6: #{retrieve_marker(6)}\n7: #{retrieve_marker(7)}   |   8: #{retrieve_marker(8)}   |   9: #{retrieve_marker(9)}\n"
  end
  def mark_position_with_marker(position, marker)
    if position.class == String then
      position = position.to_i
    end
    if @plays[position].nil? && (1..9) === position then
      @plays[position] = marker
      calculate_winner
    else
      false
    end
  end
  def calculate_winner
    @combos.each do |set|
      if @plays[set[0]] == @plays[set[1]] && @plays[set[1]] == @plays[set[2]] && @plays[set[2]] != nil then
          @winner = @plays[set[2]]
      end
    end
  end
  def unplayed_positions
    unplayed_positions = []
    @plays.each do |key, value|
      unplayed_positions.push(key) if value.nil?
    end
    unplayed_positions
  end
  def update(board)
    @plays.update(board.plays)
    @winner = board.winner
  end
end
