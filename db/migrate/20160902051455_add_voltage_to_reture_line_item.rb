class AddVoltageToRetureLineItem < ActiveRecord::Migration
  def change
    add_column :return_line_items, :voltage, :string
  end
end
