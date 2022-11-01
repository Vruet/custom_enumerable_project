# frozen_string_literal: true

# My recreations of enumerables
module Enumerable
  # Your code goes here
  def my_all?
    my_each { |item| return false unless yield item }
    true
  end

  def my_any?
    my_each { |item| return true if yield item }
    false
  end

  def my_count
    if block_given?
      count = 0
      my_each do |item|
        count += 1 if yield item
      end
      count
    else
      length
    end
  end

  def my_inject(initial_value = 0)
    total = initial_value
    my_each do |item|
      total = yield total, item
    end
    total
  end
end

# Contains recreated array methods
class Array
  def my_each
    for item in self
      yield item
    end
  end

  def my_each_with_index
    index = 0
    for item in self
      yield item, index
      index += 1
    end
  end
end
