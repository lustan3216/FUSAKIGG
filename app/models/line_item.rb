class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :order
  belongs_to :cart
  has_many :return_line_items

  def amount
    amount = 0
    amount +=  self.product.v110_price * self.qty if self.voltage == "110V"
    amount +=  self.product.v220_price * self.qty if self.voltage == "220V"
    return amount
  end

  def price
    if self.voltage == "110V"
      self.product.v110_price
    elsif self.voltage == "220V"
      self.product.v220_price
    end
  end
end
