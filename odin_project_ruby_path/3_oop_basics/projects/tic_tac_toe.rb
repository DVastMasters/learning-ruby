class Player
  attr_reader :player_name, :player_mark

  def initialize(player_name, player_mark)
    @player_name = player_name
    @player_mark = player_mark
  end
end

class Board
  @current_state = []

  def initialize
    @current_state = Array.new(9) { |i| i + 1 }
  end

  def print_current_state
    # Get marks
    array_with_marks = @current_state.map { |value| value.is_a?(Player) ? value.player_mark : value }
    array_with_marks.each_slice(3) { |slice| puts slice.join('|') }
  end

  def mark_position(position, player)
    return false if @current_state[position - 1].is_a?(Player)

    @current_state[position - 1] = player
    true
  end

  def player_win?(player)
    # Rows
    @current_state.each_slice(3) { |slice| return true if slice.uniq == [player] }

    # Columns
    4.times { |count| return true if @current_state[(count..).step(3)].uniq == [player] }

    # Cross
    [0, 2].each { |value| return true if @current_state[(value..).step(4)].uniq == [player]}

    false
  end
end

class Game
  @players
  @board

  def initialize(player1, player2, board)
    @players = [player1, player2]
    @board = board
  end

  def loop_game
    current_player = @players.sample
    until @board.player_win?(current_player)
      puts '----------------------------------'      
      puts "The current player is #{current_player.player_name}"
      @board.print_current_state
      puts "What's your next move?"
      player_move(current_player)
      if @board.player_win?(current_player)
        puts "The player #{player.player_name} wins the game!!!"
        break
      end
      current_player = (@players - [current_player])[0]
    end
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
