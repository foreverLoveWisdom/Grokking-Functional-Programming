# frozen_string_literal: true

# Achieve Scala's for comprehension in Ruby
xs = [1, 2]
ys = [4, 5]
def do_something(x, y)
  x + y
end
xs.product(ys).map { |x, y| do_something(x, y) }
# puts result.inspect

# how to use flatmap with product
xs.product(ys).flat_map

# generate the functions for the above code snippet to work

class BookAdaptation
  attr_reader :title

  def initialize(book)
    @title = book.title
  end
end

class Book
  attr_reader :title, :authors

  def initialize(title, authors)
    @title = title
    @authors = authors
  end
end

class Author
  attr_reader :name, :books

  def initialize(name, books)
    @name = name
    @books = books
  end
end

# generate the data for the above code snippet to work
books = [
  Book.new('The Lord of the Rings', [
             Author.new('J.R.R. Tolkien', [])
           ]),
  Book.new('The Hobbit', [
             Author.new('J.R.R. Tolkien', [])
           ]),
  Book.new('The Silmarillion', [
             Author.new('J.R.R. Tolkien', [])
           ]),
  Book.new('The Chronicles of Narnia', [
             Author.new('C.S. Lewis', [])
           ]),
  Book.new('The Screwtape Letters', [
             Author.new('C.S. Lewis', [])
           ]),
  Book.new('The Four Loves', [
             Author.new('C.S. Lewis', [])
           ])
]

def book_adaptation(author)
  case author.name
  when 'J.R.R. Tolkien'
    [
      BookAdaptation.new(Book.new('The Lord of the Rings', [])),
      BookAdaptation.new(Book.new('The Hobbit', [])),
      BookAdaptation.new(Book.new('The Silmarillion', []))
    ]
  when 'C.S. Lewis'
    [
      BookAdaptation.new(Book.new('The Chronicles of Narnia', [])),
      BookAdaptation.new(Book.new('The Screwtape Letters', [])),
      BookAdaptation.new(Book.new('The Four Loves', []))
    ]
  end
end

books.flat_map do |book|
  book.authors.flat_map do |author|
    book_adaptation(author).map do |movie|
      "You may like #{movie.title}, because you liked #{author.name}'s #{book.title}"
    end
  end
end

Point = Struct.new(:x, :y, :z)

xs = [1]
ys = [-2, 7]
zs = [3, 4]

xs.flat_map do |x|
  ys.flat_map do |y|
    zs.map do |z|
      point = Point.new(x, y, z)
      puts "point: #{point.inspect}"
    end
  end
end

xs.product(ys, zs).map do |x, y, z|
  point = Point.new(x, y, z)
  puts "\nPoint: #{point.inspect}"
end
