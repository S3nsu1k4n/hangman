# frozen_string_literal: true

require './lib/computer'
require './lib/player'

WORD_URI = 'https://raw.githubusercontent.com/first20hours/google-10000-english/master/google-10000-english-no-swears.txt'

GUESSES = 11
MIN_WORD_LENGTH = 5
MAX_WORD_LENGTH = 12

com = Computer.new(WORD_URI, GUESSES, MIN_WORD_LENGTH, MAX_WORD_LENGTH)
ply = Player.new

while com.guesses_remain.positive? && com.correct_letters_remain.positive?
  com.show_word
  com.show_remain_guesses

  com.take_guess(ply.choose_letter)
  com.show_word
  com.show_incorret_letters
end

if com.guesses_remain.positive?
  puts 'You won!'
else
  puts 'You lost! No guesses remaining.'
end
