require './lib/vendor'

class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.select do |vendor|
     vendor.inventory.include?(item.name)
    end
  end

  def potential_revenue
    potential_revenue = 0
    @vendors.inventory.each do |item, quantity|
        item_rev = item.price * item.amount
        potential_revenue += item_rev
    end
      #for each item, need to mulptiply item quantity by price, and if more than one item, add those products together
  end

end
