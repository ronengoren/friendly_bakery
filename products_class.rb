class Bakery
  attr_accessor :cakes, :cookies, :muffins
  def initialize
    @cakes = []
    @cookies = []
    @muffins = []
  end


  def add_pastry(pastry)
    case pastry.type
    when 'cakes'
        @cakes.push(pastry)
      when 'cookies'
        @cookies.push(pastry)
      when 'muffins'
        @muffins.push(pastry)
    end
  end
end

class Pastry
    attr_accessor :type, :image, :name, :description, :price, :amount
    def initialize(type, image, name, description, price, amount)
      @type = type
      @image = image
      @name = name
      @description = description
      @price = price
      @amount = amount
    end

end
