class ReturnOrder < ApplicationRecord
  default_scope -> { order('updated_at DESC') }

  belongs_to :user
  belongs_to :order
  has_many :return_line_items, :dependent => :destroy
  accepts_nested_attributes_for :return_line_items

  scope :dealing , -> {where('status = ?','處理中') }
  scope :done, -> { where('status =?','完成' )}
  validates :ps,:phone,:alternate_email, presence: true
  before_create :set_status_dealing

  def clone_return_line_item_by(params)
    items = params.select{|k,v| k.include?('product')}.to_a
    items.each do |item|
      a = self.return_line_items.find_or_initialize_by(line_item_id: item[0].to_i)
      a.qty = item[1]
    end
  end

  def return_price
    total_price = 0
    self.return_line_items.each do |item|
      total_price += (item.line_item.price * item.qty)
    end
    total_price
  end

  def amount
    amount = 0
    self.line_items.each do |line|
      amount +=  line.product.v110_price * line.qty if line.voltage == '110V'
      amount +=  line.product.v220_price * line.qty if line.voltage == '220V'
    end
    return amount
  end

  def return_qty
    qty = 0
    self.return_line_items.each do |item|
      qty += item.qty
    end
    qty
  end

  def items_without_qty_zero
    return_line_items.where('qty > ?',0)
  end

  private

  def set_status_dealing
    self.status = '處理中'
  end
end
