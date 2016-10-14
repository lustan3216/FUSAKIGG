class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :order
  belongs_to :cart
  has_many :return_line_items

  def amount
    amount = 0
    voltage = self.voltage.gsub("V","")
    amount += self.product.send("v#{voltage}_price") * self.qty
  end

  def show_price
    voltage = self.voltage.gsub("V","")
    self.product.send("v#{voltage}_price")
  end

  def show_voltage
    voltage = self.voltage
    voltage = '無電壓限制' if voltage == '000V'
    voltage
  end
end
