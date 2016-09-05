class RenamReturnLineItemProductId < ActiveRecord::Migration[5.0]
  def change
    rename_column :return_line_items, :product_id, :line_item_id
  end
end
