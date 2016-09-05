class ReturnLineItem < ApplicationRecord
  belongs_to :line_item

  def product
    line_item.product
  end
end
