class Cakes
  attr_accessor :description, :price, :amount
  def initialize(description, price)
    @description = description
    @price = price
    @amount = 10
  end

  def add_product(product)
      description = product.description
      price = product.to_i
      amount = product.to_i
  end
end

class Muffins
  attr_accessor :description,:price, :amount
  def initialize(description, price)
    @description = description
    @price = price
    @amount = 10
  end

  def display_muffin
    puts "#{description}"
    puts "Price: #{price}"
    puts "We have #{amount} #{description} in stock"
  end
end



class Cookies
  attr_accessor :description,:price, :amount
  def initialize(description, price)
    @description = description
    @price = price
    @amount = 10
  end

  def display_cookies
    puts "#{description}"
    puts "Price: #{price}"
    puts "We have #{amount} #{description} in stock"
  end
end
