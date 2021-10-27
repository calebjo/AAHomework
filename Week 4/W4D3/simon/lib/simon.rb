require 'colorize'

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    if @game_over == false
      round_success_message 
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    puts "Memorize this!"
    puts "----------------------------------"
    @seq.each do |color|
      case color
      when "red"
        this_color = color.colorize(:red)
      when "blue"
        this_color = color.colorize(:blue)
      when "green"
        this_color = color.colorize(:green)
      when "yellow"
        this_color = color.colorize(:yellow)
      end
      print "#{this_color}  "
      sleep(1)
    end
    sleep(1)
    system("clear")
    puts "Now enter each color you saw! (Make sure to press enter after each one.)"
  end

  def require_sequence
    user_colors = []
    (0..@seq.length-1).each do |i|
      user_colors << gets.chomp
      if user_colors[i] != @seq[i]
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "----------------------------------"
    puts "Round complete!"
    puts "----------------------------------"
  end

  def game_over_message
    puts "----------------------------------"
    puts "Game over..."
    puts "----------------------------------"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
