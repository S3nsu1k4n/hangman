# frozen_string_literal: true

require 'open-uri'



def google_10000_english_words
  word_url = 'https://raw.githubusercontent.com/first20hours/google-10000-english/master/google-10000-english-no-swears.txt'
  URI.parse(word_url).open.to_a
end

def pick_random_word_from(array)
  array.sample
end

puts pick_random_word_from google_10000_english_words
