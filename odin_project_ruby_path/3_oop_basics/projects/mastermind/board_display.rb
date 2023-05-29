module BoardDisplay
  def display_current_board_state(rounds)
    puts <<~DISPLAY
      ---------------------------------------

                    MASTERMIND

      ---------------------------------------
    DISPLAY
    rounds.each_with_index { |round, idx| display_round(round, idx + 1) }
  end

  def display_round(round_data, round_number)
    puts <<~DISPLAY

      ROUND: #{round_number}

      YOUR ATTEMPT: #{round_data[:code_pegs].join(' ')}
      KEY_PEGS: #{round_data[:key_pegs].join(' ')}

      ---------------------------------------
    DISPLAY
  end

  def display_colors_available(colors)
    puts "COLORS TO CHOOSE:"
    colors.each_with_index { |color, idx| puts "#{idx + 1} - #{color}"}
  end
end
