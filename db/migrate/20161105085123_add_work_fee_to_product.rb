class AddWorkFeeToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products ,:construction_fee ,:integer
  end
end
