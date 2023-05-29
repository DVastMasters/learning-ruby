# frozen_string_literal: true

require_relative 'board'
require_relative 'board_interaction'

def start_game
  board = Board.new
  BoardInteraction.new(board)
  conclusion(board.code_broken?)
end

def conclusion(code_broken)
  if code_broken
    display_code_breaker_winner
  else
    display_code_maker_winner
  end
end

def display_code_breaker_winner
  puts <<~DISPLAY
    THE WINNER IS THE CODE BREAKER
  DISPLAY
end

def display_code_maker_winner
  puts <<~DISPLAY
    THE WINNER IS THE CODE MAKER
  DISPLAY
end

start_game