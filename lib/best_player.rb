require_relative 'player'

class BestPlayer < Player

  def decide_next_move(board)
    opp_marker = my_opponents_mark(board)
    choices = board.unplayed_positions
    if choices.size <= 3 then
      return best_choice(board, opp_marker)
    else
      choices.each do |position|
        pretend = Board.new
        pretend.update(board)
        pretend.mark_position_with_marker(position, self.marker)
        opp_choices = pretend.unplayed_positions
        opp_choices.each do | opp_position |
          pretend.mark_position_with_marker(opp_position, opp_marker)
          return decide_next_move(pretend)
        end
      end
    end
  end

  def best_choice(board, opp_marker)
    scores = Hash.new
    unplayed_positions = board.unplayed_positions
    unplayed_positions.each do |position|
      scores[position] = if opponent_could_win(position, board, opp_marker)
                            rating = 10
                          elsif i_could_win(position, board)
                            rating = 5
                          else
                            rating = 0
                          end
    end
    scores_sorted = scores.sort_by { |position, rating| rating }
    return scores_sorted.last[0]
  end

  def i_could_win(position, board)
    hypothetical = Board.new
    hypothetical.update(board)
    hypothetical.mark_position_with_marker(position, self.marker)
    hypothetical.winner == self.marker
  end

  def opponent_could_win(position, board, opponents_mark)
    hypothetical = Board.new
    hypothetical.update(board)
    hypothetical.mark_position_with_marker(position, opponents_mark)
    hypothetical.winner == opponents_mark
  end

end
