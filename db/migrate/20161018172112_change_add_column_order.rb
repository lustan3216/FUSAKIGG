class ChangeAddColumnOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :ship_fee, :integer
    rename_column :orders, :after_ship_amount, :final_price
  end
end
