module Display
  HANGMAN = [
    " |---|\n |   O\n |  /|\\\n |  / \\\n_|_",
    " |---|\n |   O\n |  /|\\\n |  /   \n_|_ ",
    " |---|\n |   O\n |  /|\\\n |      \n_|_",
    " |---|\n |   O\n |  /|  \n |      \n_|_",
    " |---|\n |   O\n |  /   \n |      \n_|_",
    " |---|\n |   O\n |      \n |      \n_|_",
    " |---|\n |    \n |      \n |      \n_|_"
  ].freeze

  def display_figure_body(count)
    puts HANGMAN[count]
  end

  def display_correct_guesses(guesses)
    puts "WORD: \e[32m#{guesses.join(' ')}\e[0m"
  end

  def display_attempts(attempts)
    puts "INCORRECT GUESSES: \e[41m#{attempts.join(' ')}\e[0m"
  end

  def display_menu
    puts <<~DISPLAY
      -------------------------------

        WELCOME TO THE HANGMAN GAME

      -------------------------------

      Choose a option:
      1. Start a new game.
      2. Load a saved game.
      3. Quit
 
    DISPLAY
  end

  def display_current_state(state)
    puts '-------------------------------'
    display_figure_body(state.failed_attempts.length)
    puts ''
    display_correct_guesses(state.correct_attempts)
    puts ''
    display_attempts(state.failed_attempts)
    puts ''
  end

  def display_win
    puts 'Congratulations! You win.'
  end

  def display_lose(secret_word)
    puts "Oops! More lucky in next. The word: #{secret_word.join}"
  end

  def display_saved_games(saved_games)
    puts 'Your saved games: '
    saved_games.each_with_index { |fname, idx| puts "#{idx + 1}. #{Time.at(fname.to_i)}"}
  end
end
