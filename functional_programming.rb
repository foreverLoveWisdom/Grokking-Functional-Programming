# frozen_string_literal: true

def high_scoring_words(word_score)
  lambda { |higher_than|
    lambda { |words|
      words.filter { |word| word_score.call(word) > higher_than }
    }
  }
end

def high_scoring_words_without_currying(word_score, higher_than, words)
  words.filter { |word| word_score.call(word) > higher_than }
end

def score(word)
  word.count('aeiou')
end

def bonus(word)
  word.length
end

def penalty(word)
  word.count('xyz')
end

words_with_score_higher_than = lambda do |threshold|
  lambda do |words|
    words.select { |word| score(word) + bonus(word) - penalty(word) > threshold }
  end
end

words = %w[hello world zen boredom fear]
threshold = 6
puts words_with_score_higher_than.call(threshold).call(words).inspect

# word_score = ->(word) { word.count('aeiou') }
# puts high_scoring_words(word_score).call(1).call(words).inspect

# puts high_scoring_words_without_currying(word_score, 1, words).inspect
