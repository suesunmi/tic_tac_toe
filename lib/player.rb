class Player
  def initialize(name, marker)
    @name = name
    @marker = marker
  end
  attr_accessor :name, :marker
  def my_opponents_mark(board)
    board.plays.each_value do |value|
      return value if value != nil && value != @marker
    end
    nil
  end

end
