class AddAlternateEmailToReturnOreder < ActiveRecord::Migration
  def change
    add_column :return_orders, :alternate_email, :string
  end
end
