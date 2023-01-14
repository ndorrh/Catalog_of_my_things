require 'date'

class Item
  attr_accessor :genre, :author, :source, :label, :publish_date
  def initialize(genre, author, source, label, publish_date)
    @genre = genre
    genre.items << self
    @author = author
    author.items << self
    @source = source
    source.items << self
    @label = label
    label.items << self
    @publish_date = Date.parse(publish_date)
    @id = Random.rand(0..1000)
    @archive = false
  end

private
  def can_be_archived?()
    years = 0
    loop do
     publish_date = publish_date.next_year
     break if Date.today < publish_date
     years += 1
    end
   return  years > 10 ? true : false  
  end

public
  def move_to_archive()
    can_be_archived?() ? @archive = true : false
  end
end
