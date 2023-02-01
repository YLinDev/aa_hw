require 'byebug'
class Board

  attr_accessor :cups
  attr_reader :name1, :name2

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    result = []
    (0..13).each do |i|
      if i != 6 && i != 13
        result << [:stone,:stone,:stone,:stone]
      else
        result << []
      end
    end
    result
  end

  def valid_move?(start_pos)
    if cups[start_pos].nil?
      raise "Invalid starting cup"
    end
    if cups[start_pos].empty?
      raise "Starting cup is empty"
    end
    true
  end

  def make_move(start_pos, current_player_name)
    stones = cups[start_pos]
    cups[start_pos] = []
    # if current_player_name == name1
    #   store_idx = 13
    # else
    #   store_idx = 6
    # end
    #debugger
    count = start_pos
    until stones.empty?
      count += 1
      count = 0 if count > 13
      if count == 6
        cups[6] << stones.pop if current_player_name == @name1
      elsif count == 13
        cups[13] << stones.pop if current_player_name == @name2
      else
        cups[count] << stones.pop
      end
    end
    render
    next_turn(count)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif cups[ending_cup_idx].count == 1
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if cups[0..5].all? {|ele| ele.empty?}
    return true if cups[7..12].all? {|ele| ele.empty?}
    false
  end

  def winner
    player1_count = cups[6].count 
    player2_count = cups[13].count
    if player1_count == player2_count
      :draw 
    else
      player1_count > player2_count ? @name1 : @name2
    end
  end
end
