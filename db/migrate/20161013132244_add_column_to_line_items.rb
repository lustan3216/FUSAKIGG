class AddColumnToLineItems < ActiveRecord::Migration[5.0]
  def change
    add_column :line_items, :price, :integer
  end
end
