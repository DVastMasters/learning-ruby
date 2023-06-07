require 'json'

class HangMan
  attr_reader :correct_attempts, :failed_attempts, :secret_word
  attr_accessor :game_finish

  def initialize(json_data = nil)
    if json_data.nil?
      empty_game
    else
      load_data(json_data)
    end
  end

  def empty_game
    @secret_word = random_word
    @correct_attempts = Array.new(@secret_word.length, '_')
    @failed_attempts = []
    @game_finish = false
  end

  def load_data(data)
    p data
    @secret_word = data[:secret_word]
    @correct_attempts = data[:correct_attempts]
    @failed_attempts = data[:failed_attempts]
    @game_finish = data[:game_finish]
  end

  def random_word
    words = File.open('../words.txt', 'r').readlines.each_with_object([]) do |word, arr|
      next unless word.chomp.length.between?(5, 12)

      arr << word.chomp
    end
    words.sample.each_char.map { |c| c }
  end

  def verify_guess(letter)
    pos = @secret_word.each_with_index.map { |chr, idx| idx if chr.downcase == letter }.compact
    if !pos.empty?
      pos.each { |idx| @correct_attempts[idx] = @secret_word[idx] }
      true
    else
      @failed_attempts << letter
      false
    end
  end

  def win?
    @secret_word.eql?(@correct_attempts)
  end

  def to_json
    JSON.dump({
      secret_word: @secret_word,
      correct_attempts: @correct_attempts,
      failed_attempts: @failed_attempts,
      game_finish: @game_finish
    })
  end

  def self.from_json(json)
    data = JSON.parse(json, {symbolize_names: true})
    new(data)
  end
end