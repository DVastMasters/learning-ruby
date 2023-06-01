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
end
