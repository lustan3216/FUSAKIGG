class Order < ApplicationRecord
  default_scope -> { order('updated_at DESC') }
  scope :outstanding, -> { where( 'paid = ?',false) }
  scope :paid, -> { where( 'paid = ? and status =?',true ,'處理中' ) }
  scope :orderdone, -> { where( 'paid = ? and status =?',true ,'完成') }

  has_one :return_order
  belongs_to :user
  has_one :payment
  has_many :line_items, :dependent => :destroy
  has_many :products, :through => :line_items

  before_validation :assign_order_number
  validates :name, :email,:address ,:phone,:postcode, :ship_time, :whoset,:county ,:district, presence: true

  def self.ship_fee
    150
  end

  def self.ship_fee_boundary
    1500
  end

  def self.traffic_allowanc_boundary
    3000
  end

  def self.traffic_allowanc
    500
  end

  def self.discount_percent
    0.6
  end

  def ship_fee?
    Order.ship_fee if calc_shipfee < Order.ship_fee_boundary
  end

  def clone_line_items_by(cart)
    cart.line_items.each do |line|
      self.line_items.build( :product => line.product, :qty => line.qty , :voltage=> line.voltage )
    end
  end

  def update_cart_line_items_by(cart)
    cart.line_items.each do |line|
      product = self.line_items.find_by(product:line.product,voltage:line.voltage)
      product ? (qty = line.qty + product.qty) : (qty = line.qty)
      find_or_initialize_line = self.line_items.find_or_initialize_by(product:line.product,voltage:line.voltage)
      find_or_initialize_line.update(qty:qty)
    end
  end

  def update_item_qty(order_params)
    items = order_params.select{|h| /\d/.match(h) }.map{|h,v|[h.to_i,v.to_i]}
    items.each do |k,v|
      self.line_items.find(k).update(qty: v)
    end
  end

  def total
    self.line_items.map{ |l| l.qty }.sum
  end

  def copy_info_to(user)
    user.assign_attributes( name:self.name , address:self.address , phone:self.phone,
                            postcode:self.postcode , alternate_email:self.email )
  end

  def remove_product(item_id)
    line_item = self.line_items.find( item_id )
    line_item.destroy
    self.destroy if self.line_items.blank?
  end

  def full_address
    [self.postcode.to_s , self.county , self.district , self.address].join('')
  end

  def amount(whoset = "本公司派專業師傅安裝")
    amount = 0
    self.line_items.each do |line|
      voltage = line.voltage.gsub("V","")
      amount += line.product.send("v#{voltage}_price") * line.qty
    end
    amount *= Order.discount_percent if whoset == "自行安裝（打6折）"
    amount.to_i
  end

  def calc_final_price
    # amount(whoset) + calc_traffic_allowanc(whoset) + calc_shipfee(whoset)
    calc_shipfee + amount(whoset) + calc_traffic_allowanc
  end

  def calc_traffic_allowanc
    fee = 0
    if whoset == "本公司派專業師傅安裝"
      fee = Order.traffic_allowanc if amount < Order.traffic_allowanc_boundary
      return fee
    end
    fee
    # traffic_allowanc
  end

  def calc_shipfee
    fee = 0
    if whoset == "自行安裝（打6折）"
      price = amount * 0.6
      fee = Order.ship_fee if price < Order.ship_fee_boundary
      return fee
    end
    fee
    # ship_fee
  end

  private

  def assign_order_number
    self.assign_attributes(order_number: self.id.to_s + Time.current.strftime('%s'))
  end
end
