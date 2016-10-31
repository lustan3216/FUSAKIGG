class AddBooleanThankqChackToPayment < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :is_need_thank ,:boolean, default: true
  end
end
