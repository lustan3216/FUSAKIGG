class RenameOrderAmount < ActiveRecord::Migration
  def change
    rename_column :orders, :amount, :after_ship_amount
  end
end
