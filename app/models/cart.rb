class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :products, :through => :line_items

  def update_item_qty(order_params)
    items = order_params.select{|h| /\d/.match(h) }.map{|h,v|[h.to_i,v.to_i]}
    items.each do |k,v|
      self.line_items.find(k).update(qty: v)
    end
  end

  def add_product(product, qty , voltage)
    line_item = self.line_items.find_by(product_id: product.id ,voltage: voltage)
    if line_item
      line_item.qty += qty
      line_item.save!
    else
      self.line_items.create!( :product => product, :qty => qty, :voltage => voltage )
    end
  end

  def remove_product(item_id)
    line_item = self.line_items.find(item_id)
    line_item.destroy
  end

  def total
    self.line_items.map{ |l| l.qty }.sum
  end

  def amount
    amount = 0
    self.line_items.each do |line|
      amount +=  line.product.v110_price * line.qty if line.voltage == "V110"
      amount +=  line.product.v220_price * line.qty if line.voltage == "V220"
    end
    return amount
  end

  def final_price(whoset = "本公司派專業師傅安裝")
    price = self.amount
    price *=0.6 if whoset == "自行安裝（打６折）"
    price >= 2000 ? price : price + Order.ship_fee
  end
end
