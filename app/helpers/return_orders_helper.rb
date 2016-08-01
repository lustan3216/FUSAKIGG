module ReturnOrdersHelper

  def return_item_qty(item)
  qty = ReturnLineItem.find_by(return_order_id:item.order,product_id:item.product_id).try(:qty)
    qty.nil? ? item.qty : qty
  end
end
