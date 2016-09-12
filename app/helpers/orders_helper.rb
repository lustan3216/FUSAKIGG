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

  def render_table
    case params[:status]
      when 'outstanding'
        render 'users/outstanding' , order:@order
      when 'paid'
        render 'users/paid' , order:@order
      when 'done'
        render 'users/done' , order:@order
    end
  end
end
