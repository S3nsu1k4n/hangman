# frozen_string_literal: true

# The Player
# chooses letters which should be inside the random word from the computer
# computer evalues the letter
class Player
  def choose_letter
    puts 'Guess a letter!'
    letter = gets.gsub("\n", '')[0]
    puts "--> '#{letter}'"
    letter
  end
end
