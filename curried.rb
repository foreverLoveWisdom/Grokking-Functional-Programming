# frozen_string_literal: true

def greater_than(num)
  ->(val) { val > num }
end

def shorter_than(num)
  ->(val) { val.length < num }
end

def divisible_by(num)
  ->(val) { (val % num).zero? }
end

puts [1, 2, 3, 4, 5].select(&greater_than(4)).inspect
puts %w[i e cat dog horse].select(&shorter_than(2)).inspect
puts [1, 2, 3, 4, 5].select(&divisible_by(2)).inspect
