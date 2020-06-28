require './lib/vendor'
require 'date'

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
      total_amount = vendors_that_sell(item).sum do |vendor|
        vendor.inventory[item]
      end
      total[item] = {quantity: total_amount, vendors: vendors_that_sell(item)}
    end
    total
  end

  def overstocked_items
    result = []
    total_inventory.each do |item, item_info|
      result << item if total_inventory[item][:quantity] > 50 && total_inventory[item][:vendors].count > 1
    end
    result
  end

  def sort_list
    all_items = @vendors.flat_map do |vendor|
      vendor.inventory.keys
    end
    all_items.map do |item|
      item.name
    end.uniq.sort
  end

  def date_created
    date = DateTime.now.strftime("%d/%m/%y")
  end

end
