class Cart < ApplicationRecord
  has_many :line_items, :dependent => :destroy
  has_many :products, :through => :line_items

  def update_item_qty(order_params)
    items = order_params.select{|h| /\d/.match(h) }.to_a
    items.each do |k,v|
      self.line_items.find(k.to_i).update(qty: v.to_i)
    end
  end

  def add_product(product, params)
    qty = params[:qty].to_i
    voltage = params[:voltage]
    line_item = self.line_items.find_by(product_id: product.id ,voltage: voltage)
    if line_item
      line_item.qty += qty
      line_item.save!
    else
      self.line_items.create!( product: product,
                               qty: qty, :voltage => voltage,
                               price: product.send("v#{voltage.gsub("V","")}_price"),
                               construction_fee: product.construction_fee * qty )
    end
  end

  def remove_product(item_id)
    line_item = self.line_items.find(item_id)
    line_item.destroy
  end

  def update_data(id,qty)
    line_item = self.line_items.find(id)
    construction_fee = ( line_item.product.construction_fee * qty )
    line_item.update(qty: qty ,construction_fee: construction_fee)
  end

  def total
    self.line_items.map{ |l| l.qty }.sum
  end

  def amount(whoset = "本公司派專業師傅安裝")
    amount = 0
    self.line_items.each do |line|
      voltage = line.voltage.gsub("V","")
      amount += line.product.send("v#{voltage}_price") * line.qty
    end
    # amount *= Order.discount_percent if whoset == "自行安裝"
    amount.to_i
  end

  def calc_final_price(whoset = "本公司派專業師傅安裝")
    amount(whoset) + calc_traffic_allowanc(whoset) + calc_shipfee(whoset) + calc_construction_fee
  end

  def calc_construction_fee
    sum = 0
    line_items.each {|item| sum += item.construction_fee }
    sum
  end

  def calc_construction_fee_allowanc
    calc_construction_fee + calc_traffic_allowanc
  end

  def calc_traffic_allowanc(whoset = "本公司派專業師傅安裝")
    fee = 0
    if whoset == "本公司派專業師傅安裝"
      fee = Order.traffic_allowanc if amount < Order.traffic_allowanc_boundary
      return fee
    end
    fee
  end

  def calc_shipfee(whoset = "本公司派專業師傅安裝")
    fee = 0
    if whoset == "自行安裝"
      # price = amount * 0.6
      fee = Order.ship_fee if amount < Order.ship_fee_boundary
      return fee
    end
    fee
  end

end
