class ReturnOrder < ApplicationRecord
  default_scope -> { order('updated_at DESC') }

  belongs_to :user
  belongs_to :order
  has_many :return_line_items
  accepts_nested_attributes_for :return_line_items

  scope :dealing , -> {where('status = ?',"處理中") }
  scope :return_done, -> { where('(status =? or status =?)',"OK" ,"ok"  ) }

  validates :ps,:phone, presence: true

  def clone_return_line_item_by(params)
    items = params.select{|k,v| k.include?( "product")}.to_a
    items.each do |item|
      a = self.return_line_items.find_or_initialize_by(product_id: item[0])
      a.update(qty:item[1])
    end
  end
end
