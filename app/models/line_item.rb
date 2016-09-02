class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :order
  belongs_to :cart

  def amount
    amount = 0
    amount +=  self.product.v110_price * self.qty if self.voltage == "V110"
    amount +=  self.product.v220_price * self.qty if self.voltage == "V220"
    return amount
  end

  def price
    if self.voltage == "V110"
      self.product.v110_price
    elsif self.voltage == "V220"
      self.product.v220_price
    end
  end

  def show_voltage
    return "110V" if self.voltage == "V110"
    return "220V" if self.voltage == "V220"
  end
end
