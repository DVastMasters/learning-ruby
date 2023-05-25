# frozen_string_literal: true

# Class to encapsulate players info
class Player
  attr_reader :name, :mark

  def initialize(name, mark)
    @name = name
    @mark = mark
  end
end

# Class to encapsulate board data and provide
# some methods to manipulate the board
class Board
  ROWS = 3
  COLUMNS = 3
  TOTAL_POSITIONS = ROWS * COLUMNS
  @current_state = []

  def initialize
    @current_state = Array.new(TOTAL_POSITIONS) { |i| i + 1 }
  end

  def print_current_state
    # Get player marks
    array_with_marks = @current_state.map { |value| value.is_a?(Player) ? value.mark : value }
    array_with_marks.each_slice(ROWS) { |slice| puts slice.join('|') }
  end

  def mark_position(position, player)
    return false if @current_state[position - 1].is_a?(Player)

    @current_state[position - 1] = player
    true
  end

  def player_win?(player)
    # Rows
    @current_state.each_slice(ROWS) { |slice| return true if slice.uniq == [player] }

    # Columns
    COLUMNS.times { |count| return true if @current_state[(count..).step(ROWS)].uniq == [player] }

    # Cross 0 - 4 - 8
    return true if @current_state[(0..).step(4)].uniq == [player]

    # Cross 2 - 4 - 6
    return true if [@current_state[2], @current_state[4], @current_state[6]].uniq == [player]

    false
  end

  def draw?
    @current_state.none?(Integer)
  end
end

# Class to encapsulate every game data
class Game
  @players = []
  @board = []
  @current_player = nil

  def initialize(player1, player2, board)
    @players = [player1, player2]
    @board = board
    @current_player = @players.sample
  end

  def loop_game
    until @board.player_win?(@current_player) || @board.draw?
      next_player
      puts '----------------------------------'
      puts "The current player is #{@current_player.name}. Mark: #{@current_player.mark}"
      @board.print_current_state
      puts "What's your next move?"
      player_move(@current_player)
      @board.print_current_state
    end
    end_game
  end

  private

  def end_game
    if @board.draw?
      puts 'The game ends in a draw!!'
    else
      puts "The player #{@current_player.name} wins the game!!!"
    end
  end

  def next_player
    @current_player = (@players - [@current_player])[0]
  end

  def player_move(player)
    loop do
      pos = gets.match(/\d+/)[0]
      marked = @board.mark_position(pos.to_i, player)
      break if marked

      puts 'Position already marked! Choose another.'
    rescue NoMethodError
      puts 'Please, input a number between 1-9.'
      redo
    end
  end
end

b = Board.new
p1 = Player.new('R', 'X')
p2 = Player.new('F', 'O')

game = Game.new(p1, p2, b)
game.loop_game
