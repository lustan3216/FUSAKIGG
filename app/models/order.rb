class Order < ApplicationRecord
  default_scope -> { order('updated_at DESC') }
  scope :nonpay, -> { where( 'paid = ?',false) }
  scope :paid, -> { where( 'paid = ? and status =?',true ,"處理中" ) }
  scope :orderdone, -> { where( 'paid = ? and (status =? or status =?)',true ,"OK" ,"ok"  ) }

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

  def ship_fee?
    Order.ship_fee if calc_price_with_shipfee < 2000
  end

  def clone_cart_line_items_by(cart)
    cart.line_items.each do |line|
      a = self.line_items.build( :product => line.product, :qty => line.qty , :voltage=> line.voltage )
      a.voltage = line.voltage if line.voltage == ("110V" || "220V")
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
    user.update_attributes( name:self.name , address:self.address , phone:self.phone,
                            postcode:self.postcode , alternate_email:self.email )
  end

  def remove_product(item_id)
    line_item = self.line_items.find( item_id )
    line_item.destroy
    self.destroy if self.line_items.blank?
  end

  def amount
    amount = 0
    self.line_items.each do |line|
      amount +=  line.product.v110_price * line.qty if line.voltage == "110V"
      amount +=  line.product.v220_price * line.qty if line.voltage == "220V"
    end
    return amount
  end 

  def calc_price_with_shipfee
    price = self.amount
    price *=0.6 if self.whoset == "自行安裝（打６折）"
    price >= 2000 ? price.to_i : (price + Order.ship_fee).to_i
  end

  def full_address
    [self.postcode.to_s , self.county , self.district , self.address].join("")
  end

  private

  def assign_order_number
    self.assign_attributes(order_number: self.id.to_s + Time.current.strftime('%s'))
  end
end
