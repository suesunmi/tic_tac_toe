  def mark_multiple_positions(board, hash)
    hash.each do |position, marker|
      @board.mark_position_with_marker(position, marker)
    end
  end

