class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :item_name
      t.string :description
      t.integer :v110_price
      t.integer :v220_price

      t.timestamps null: false
    end
  end
end
