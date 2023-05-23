class Player
  attr_reader :player_name, :player_mark

  def initialize(player_name, player_mark)
    @player_name = player_name
    @player_mark = player_mark
  end
end

class Board
  @current_state = [[]]

  def initialize
    change_board_state(Array.new(9) { |i| i + 1 })
  end

  def print_current_state
    @current_state.each { |value| puts value.join('|') }
  end

  def mark_position(position, player_mark)
    flatten_board = @current_state.flatten
    flatten_board[position - 1].between?(1, 9)
    flatten_board[position - 1] = player_mark
    change_board_state(flatten_board)
    true
  rescue ArgumentError
    puts 'Position is already marked'
    false
  end

  def verify_win
    flatten_board = @current_state.flatten
    winner = sequence_equal?(flatten_board, 3)
    puts "Player with #{winner} mark wins!!" unless winner.empty?

    col = 1
    flatten_board = @current_state.cycle(3).flat_map { |row| row[col] }
    winner = sequence_equal?(flatten_board, 3)
    puts "Player with #{winner} mark wins!!" unless winner.empty?
  end

  private

  def sequence_equal?(flatten_values, sequence_length)
    flatten_values.each_slice(sequence_length) { |slice| return slice[0] if slice.uniq.count == 1 }
    ''
  end

  def change_board_state(flatten_array)
    @current_state = flatten_array.each_slice(3).map { |slice| slice }
  end
end

class Game
  @player1
  @player2
  @board

  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board = board
    start_game
  end
end

board = Board.new

board.print_current_state
p board.mark_position(3, 'X')
p board.mark_position(1, 'X')
p board.mark_position(2, 'X')
board.print_current_state
board.verify_win
