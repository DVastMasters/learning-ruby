# frozen_string_literal: true

require_relative 'board_display'

class BoardInteraction
  include BoardDisplay

  MAX_ATTEMPTS = 12

  def initialize(board)
    @attempts_left = MAX_ATTEMPTS
    @rounds = []
    @board = board
    loop_interaction
  end

  def loop_interaction
    until @attempts_left.zero? || @board.code_broken?
      display_current_board_state(@rounds)
      attempt = pick_user_attempt
      @rounds << {
        code_pegs: attempt,
        key_pegs: @board.return_key_pegs_to(attempt)
      }
      @attempts_left -= 1
    end
    display_current_board_state(@rounds)
  end

  def pick_user_attempt
    colors_picked = []
    until colors_picked.size == 4
      display_colors_available(Board::COLORS)
      color_number = gets.chomp.to_i
      colors_picked << Board::COLORS[color_number - 1]
    end
    colors_picked
  end
end
