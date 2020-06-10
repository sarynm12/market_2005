class Vendor
  attr_reader :name, :inventory, :stock

  def initialize(name)
    @name = name
    @inventory = {}
    @stock = Hash.new(0)
  end

  def stock_check(item)
    @stock[item]
  end


end
