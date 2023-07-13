# frozen_string_literal: true

# The Player
# chooses letters which should be inside the random word from the computer
# computer evalues the letter
# can save and load the game
class Player
  def initialize
    @save_dir = 'data'
    @save_filename = "#{@save_dir}/game.sav"
  end

  def action
    puts '0: guess letter'
    puts '1: save game'
    puts '...'
    loop
    case gets.gsub("\n", '')
    when '0'
      choose_letter
    when '1'
      save_game
    end
  end

  def choose_letter
    puts 'Guess a letter...'
    letter = gets.gsub("\n", '')[0]
    puts "--> '#{letter}'"
    letter
  end

  def save_game(game)
    ser = Marshal.dump(game)
    Dir.mkdir(@save_dir) unless Dir.exist?(@save_dir)
    File.open(@save_filename, 'w') { |file| file.puts ser }
    puts 'Game saved!'
  end

  def load_game
    ser = File.open(@save_filename, 'r').read
    Marshal.load(ser)
  end
end
