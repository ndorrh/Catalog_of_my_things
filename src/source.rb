class Source
  attr_accessor :name
  def initialize(name)
    @id = Random.rand(0..100)
    @name = name
    @items = []
  end

  def add_item(item)
    item.source = self
    @items << item
  end
end