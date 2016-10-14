class Cart < ApplicationRecord
  has_many :line_items, :dependent => :destroy
  has_many :products, :through => :line_items

  def update_item_qty(order_params)
    items = order_params.select{|h| /\d/.match(h) }.to_a
    items.each do |k,v|
      self.line_items.find(k.to_i).update(qty: v.to_i)
    end
  end

  def add_product(product, qty , voltage)
    line_item = self.line_items.find_by(product_id: product.id ,voltage: voltage)
    if line_item
      line_item.qty += qty
      line_item.save!
    else
      self.line_items.create!( :product => product, :qty => qty, :voltage => voltage,:price => product.send("v#{voltage.gsub("V","")}_price") )
    end
  end

  def remove_product(item_id)
    line_item = self.line_items.find(item_id)
    line_item.destroy
  end

  def update_qty(id,qty)
    self.line_items.find(id).update(qty:qty)
  end

  def total
    self.line_items.map{ |l| l.qty }.sum
  end

  def amount
    amount = 0
    self.line_items.each do |line|
      voltage = line.voltage.gsub("V","")
      amount += line.product.send("v#{voltage}_price") * line.qty
    end
    amount
  end

  def calc_price_with_shipfee(whoset = "本公司派專業師傅安裝")
    price = self.amount
    price *=0.6 if whoset == "自行安裝（打６折）"
    price >= Order.ship_fee_boundary ? price : price + Order.ship_fee
  end
end
