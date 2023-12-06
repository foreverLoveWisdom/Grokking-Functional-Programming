# frozen_string_literal: true

Book = Struct.new(:title, :authors)

def book_adaptations(author)
  author == 'Tolkien' ? %w[the_lord_of_the_ring harry_potter] : ["#{author.inspect} has no adaptations"]
end

def recommendation_feed(books)
  books.flat_map do |book|
    book.authors.flat_map do |author|
      book_adaptations(author).map do |movies|
        "You may like #{movies}, because you liked #{author}'s #{book.title}"
      end
    end
  end
end

Point = Struct.new(:x, :y)

puts [1].flat_map { |x| [3, 6].map { |y| Point.new(x, y) } }.inspect
