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

  def what_col_in(order)
    if order.whoset == '本公司派專業師傅安裝'
      "col-sm-3 col-xs-12 mb10"
    else
      "col-sm-4 col-xs-12 mb10"
    end
  end

  def select_default(order)
    if order.whoset == "自行安裝（打６折）"
      "自行安裝（打６折）"
    else
      "本公司派專業師傅安裝"
    end
  end
end
