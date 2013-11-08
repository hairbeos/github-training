class Book
  # attr_reader :isbn, :title
  # attr_writer :isbn, :title

  attr_accessor :isbn, :title

  def initialize(title, isbn)
    @title = title
    @isbn = isbn
  end

  def to_string
    "ISBN: #{@isbn}, title: #{@title}, full title: #{@full_title}"
  end

  def isbn
    @isbn
  end

  def isbn=(isbn)
    @isbn=isbn
  end

  # virtual attr
  def full_title
    "Full - #{title}"
  end

  def full_title=(full_title)
    @title = full_title
  end
end

book1 = Book.new("FUNC", '12355656')
puts book1.to_string
book1.isbn = "12345"
book1.title = "PATAHA"
book1.full_title = "FULL - PATAHA"
puts book1.to_string
puts book1.full_title
