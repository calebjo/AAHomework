class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new(4, :stone) }
    @cups[6], @cups[13] = [], []
  end

  def valid_move?(start_pos)
    raise Exception.new("Invalid starting cup") if start_pos > 12 || start_pos < 0
    raise Exception.new("Starting cup is empty") if @cups[start_pos] == []
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos].length
    @cups[start_pos] = []
    
    cup_index = 0
    (1..stones).each do |i|
      cup_index = (start_pos + i) % 14

      case cup_index
      when 6
        @cups[cup_index] << :stone if current_player_name == @name1
      when 13
        @cups[cup_index] << :stone if current_player_name == @name2
      else
        @cups[cup_index] << :stone
      end
    end
    render

    next_turn(cup_index)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 13 || ending_cup_idx == 6 # points cup
      :prompt
    elsif @cups[ending_cup_idx].length == 1 # empty cup
      :switch
    else # cup with stones in it
      ending_cup_idx
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
    @cups[0..5].all? {|cup| cup.empty? } || @cups[7..12].all? {|cup| cup.empty? }
  end

  def winner
    score_1 = @cups[6].length
    score_2 = @cups[13].length
    case score_1 <=> score_2
    when 0
      :draw
    when 1
      @name1
    when -1
      @name2
    end
  end
end
