class AddColumnToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :v000_price, :integer
  end
end
