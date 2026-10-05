# frozen_string_literal: true

# Order class to initialize the order object per row
class Order
  attr_reader :id, :customer, :status, :amount

  def initialize(order)
    @id, @customer, @status, @amount = order
    @id = @id.to_i
    @amount = @amount.to_i
  end
end
