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
    if current_player_name == name1
      store_idx = 13
    else
      store_idx = 6
    end
    stones = cups[start_pos]
    cups[start_pos] = []
    stones.each do |stone|
      if start_pos+1 == store_idx
        start_pos = (start_pos+2 % cups.length)
      else
        start_pos = (start_pos+1 % cups.length)
      end
      cups[start_pos] << stone
    end
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
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
    return name1 if cups[0..5].all? {|ele| ele.empty?}
    return name2 if cups[7..12].all? {|ele| ele.empty?}
  end
end
