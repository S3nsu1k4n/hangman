# frozen_string_literal: true

require 'open-uri'

# The Computer the player has to battle with
# picks random word from the uri
# takes in the chosen letters from the player and evaluates it
# prints the results
class Computer
  attr_reader :guesses_remain, :correct_letters_remain

  def initialize(uri, guesses, min_word_length, max_word_length)
    @uri = uri
    @guesses = guesses
    @guesses_remain = guesses
    @min_word_length = min_word_length
    @max_word_length = max_word_length
    @word_to_guess = 'random' # pick_random_word_from google_10000_english_words
    @correct_letters = []
    @incorrect_letters = []
    @correct_letters_remain = @word_to_guess.length
  end

  def google_10000_english_words
    URI.parse(@uri).open.to_a.select { |word| word.length.between?(@min_word_length, @max_word_length) }
  end

  def pick_random_word_from(array)
    array.sample
  end

  def show_word
    word = @word_to_guess.split('').map { |letter| @correct_letters.include?(letter) ? letter : '_' }.join(' ')
    @correct_letters_remain = word.count '_'
    puts word
  end

  def take_guess(letter)
    return if letter.nil?

    letter = letter.downcase
    if @word_to_guess.include?(letter)
      @correct_letters.push(letter) unless @correct_letters.include?(letter)
    elsif @incorrect_letters.include?(letter) || @correct_letters.include?(letter)
      puts 'Letter already used!'
    else
      @incorrect_letters.push(letter)
      @guesses_remain -= 1
    end
  end

  def show_incorret_letters
    puts "Incorrect: #{@incorrect_letters}"
  end

  def show_remain_guesses
    puts "Guess #{@guesses_remain} / #{@guesses}:"
  end
end
