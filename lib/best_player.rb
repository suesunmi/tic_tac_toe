require_relative 'player'

class BestPlayer < Player

  def decide_next_move(board)
    opponent = board.opponent(self.marker)
    choices = Hash.new
    board.unplayed_positions.each do |position|
      pretend = Board.new
      pretend.update(board)
      pretend.mark_position_with_marker(position, self.marker)
      choices[position] = -(best(pretend, opponent))
    end
    return choices.key(choices.values.max)
  end

  def best(board, node_player)
    node_opponent = board.opponent(node_player)
    if board.winner != ""
      if board.winner == node_player
        return 100
      elsif board.winner == node_opponent
        return -100
      end
    elsif board.unplayed_positions.size == 0
      return 0
    end

    max_score = -1000
    choices = board.unplayed_positions
    choices.each do |position|
      pretend = Board.new
      pretend.update(board)
      pretend.mark_position_with_marker(position, node_player)
      this_score = -(best(pretend, node_opponent) + choices.size)
      max_score = this_score if this_score > max_score
    end
    return max_score
  end

end
