class CreateReturnLineItems < ActiveRecord::Migration
  def change
    create_table :return_line_items do |t|
      t.integer :qty
      t.integer :product_id
      t.integer :return_order_id


      t.timestamps null: false
    end
  end
end
