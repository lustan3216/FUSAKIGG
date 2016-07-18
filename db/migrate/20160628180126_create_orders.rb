class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer  "user_id"
      t.string   "name"
      t.string   "email"
      t.string   "address"
      t.integer  "postcode"
      t.string   "phone"
      t.string   "freight"
      t.text     "ps"
      t.integer  "amount"
      t.string   "whoset"
      t.string   "ship_time"
      t.string   "status"
      t.string   "payment_status"
      t.string   "shipping_status"

      t.timestamps null: false
    end
  end
end
