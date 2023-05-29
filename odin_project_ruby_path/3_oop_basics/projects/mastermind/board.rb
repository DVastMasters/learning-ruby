class Board
  COLORS = [
    "\e[32mGREEN\e[0m", "\e[31mRED\e[0m", "\e[35mMAGENTA\e[0m",
    "\e[34mBLUE\e[0m", "\e[37mGRAY\e[0m", "\e[33mBROWN\e[0m"
  ].freeze

  def initialize
    @code = pick_random_code
    @code_broken = false
  end

  def code_broken?
    @code_broken
  end

  def pick_random_code
    COLORS.sample(4)
  end

  def return_key_pegs_to(attempt)
    if attempt.eql?(@code)
      @code_broken = true
      return []
    end

    attempt.each_with_index.map { |color, idx| key_peg_to(color, idx) }.compact
  end

  def key_peg_to(color, position)
    return "\e[41mRED\e[0m" if @code[position].eql?(color)

    return "\e[47m\e[30mWHITE\e[0m\e[0m" if @code.any?(color)

    nil
  end
end
