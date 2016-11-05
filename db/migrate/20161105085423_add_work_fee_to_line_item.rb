class AddWorkFeeToLineItem < ActiveRecord::Migration[5.0]
  def change
    add_column :line_items ,:construction_fee ,:integer
  end
end
