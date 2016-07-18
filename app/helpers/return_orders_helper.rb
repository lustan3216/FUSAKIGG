module ReturnOrdersHelper

  def return_item_qty(item)
  ReturnLineItem.find_by(return_order_id:item.order,product_id:item.product_id).try(:qty)
  end
end
