class CreateReturnOrders < ActiveRecord::Migration
  def change
    create_table :return_orders do |t|
      t.text :ps
      t.integer :phone
      t.integer :user_id
      t.string :status
      t.integer :order_id

      t.timestamps null: false
    end
  end
end
