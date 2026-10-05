# frozen_string_literal: true

require 'csv'
require_relative 'csv_reader'
require_relative 'order'

# ReportGenerator class to handle the data, perform operations and
# return the result
class ReportGenerator
  attr_reader :result

  def initialize(orders)
    @orders = orders
    @result = Hash.new do |hash, key|
      hash[key] = {
        completed_orders: 0,
        pending_orders: 0,
        total_completed_amount: 0
      }
    end
  end

  def generate_report
    @orders.shift
    @orders.each do |order|
      order_object = Order.new(order)
      process_order(order_object)
    end
    @result
  end

  def process_order(order_object)
    value_hash = @result[order_object.customer]
    value_hash[:completed_orders] += 1 if order_object.status == 'completed'
    value_hash[:pending_orders] += 1 if order_object.status == 'pending'
    value_hash[:total_completed_amount] += order_object.amount if order_object.status == 'completed'
  end
end

reader_object = CSVReader.new('info.csv')
report_object = ReportGenerator.new(reader_object.csv_data)
p report_object.generate_report
