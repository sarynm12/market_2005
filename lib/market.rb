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
     vendor.inventory.keys.include?(item)
   end
  end

  def total_inventory
    total = {}
    items = @vendors.flat_map do |vendor|
      vendor.inventory.keys
    end.uniq
    items.each do |item|
      vendors_for_item = vendors_that_sell(item)
      total_amount = vendors_for_item.sum do |vendor|
        vendor.inventory[item]
      end
      total[item] = {quantity: total_amount, vendors: vendors_for_item}
    end
    total
  end

  def sort_list
    all_items = @vendors.flat_map do |vendor|
      vendor.inventory.keys
    end
    all_items.map do |item|
      item.name
    end.uniq.sort 
  end

end
