module OrdersHelper
  def discount_line_through
    'line_through' if @order.whoset == '自行安裝（打６折）'
  end

  def discount_label
    'visible'  if @order.whoset == '自行安裝（打６折）'
  end

  def cart_or_order
     controller_name == "orders" && action_name == "new" ? current_cart : @order
  end

end
