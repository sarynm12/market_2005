class Vendor
  attr_reader :name, :inventory, :stock

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
    @stock = Hash.new(0)
  end

  def check_stock(item)
    @stock[item]
  end

  def stock(item, quantity)
    @inventory[item] += quantity
    @stock[item] += quantity
  end


end
