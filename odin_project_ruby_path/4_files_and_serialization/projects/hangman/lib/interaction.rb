require_relative 'hangman'
require_relative 'display'

class Interaction
  include Display

  MAX_ATTEMPTS = HANGMAN.size - 1

  def initialize
    op = menu
    until op == 3
      case op
      when 1 then new_game
      when 2 then load_game
      end
      finish_game if @current_game.game_finish
      op = menu
    end
  end

  def menu
    op = 0
    until op.between?(1, 3)
      display_menu
      op = gets.chomp.to_i
    end
    op
  end

  def new_game
    @current_game = HangMan.new
    loop_game
  end

  def load_game
    saved_games = Dir.foreach('../data').map { |f| File.basename(f, '.*') unless f.start_with?('.') }.compact
    display_saved_games(saved_games)
    op = -1
    until op.between?(1, saved_games.size)
      print 'Choose a save (or input 0 to go back): '
      op = gets.chomp.to_i
      return if op.zero?
    end
    @current_game = HangMan.from_json(File.new("../data/#{saved_games[op - 1]}.json").read)
    loop_game
  end

  def loop_game
    until @current_game.failed_attempts.size == MAX_ATTEMPTS || @current_game.win?
      display_current_state(@current_game)
      letter = user_guess
      if letter.eql?('0')
        save_game
        return
      end
      @current_game.verify_guess(letter)
    end
    @current_game.game_finish = true
  end

  def finish_game
    display_current_state(@current_game)
    if @current_game.win?
      display_win
    else
      display_lose(@current_game.secret_word)
    end
    print 'Press enter to continue...'
    gets
  end

  def already_guessed?(guess)
    @current_game.correct_attempts.include?(guess) ||
      @current_game.failed_attempts.include?(guess)
  end

  def user_guess
    letter = '_'
    while already_guessed?(letter)
      print 'Input a letter (or enter 0 to save the game): '
      letter = gets.chomp
    end
    letter[0].downcase
  end

  def save_game
    Dir.mkdir('../data') unless Dir.exist?('../data')
    File.open("../data/#{Time.new.to_i}.json", 'w') { |file| file.write(@current_game.to_json) }
  end
end

interaction = Interaction.new