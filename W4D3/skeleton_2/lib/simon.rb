class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    while !@game_over
      self.take_turn
    end
    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    if self.require_sequence
      return self.round_success_message
    else
      @game_over = true 
    end
    @sequence_length += 1
  end

  def show_sequence
    p self.add_random_color
  end

  def require_sequence
    p "Please input the order of the colors"
    answers = gets.chomp.split(' ')
    answers == @seq
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    p "You matched all colors, great job!"
  end

  def game_over_message
    p "Game over, try again"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

Simon.new.play