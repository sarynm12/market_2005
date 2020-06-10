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
    @vendors.each do |vendor|
      #for each item, need to mulptiply amount by price, and if more than one item, add those products together
  end

end
