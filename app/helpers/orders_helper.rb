module OrdersHelper
  def discount_line_through
    'line_through' if @order.whoset == '自行安裝（打６折）'
  end

  def discount_label
    'visible'  if @order.whoset == '自行安裝（打６折）'
  end

end
