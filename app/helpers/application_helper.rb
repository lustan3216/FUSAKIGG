module ApplicationHelper

  def generate_pay2go_params(payment)
    payment[:payment_method] == "Credit" ? credit = 1 : credit = 0
    payment[:payment_method] == "WebATM" ? webatm = 1 : webatm = 0
    payment[:payment_method] == "ATM" ? vacc = 1 : vacc = 0
    pay2go_params = {
      MerchantID: Pay2go.merchant_id,
      RespondType: "JSON",
      TimeStamp: payment.created_at.to_i,
      Version: "1.2",
      LangType: "zn-TW",
      MerchantOrderNo: payment.external_id,
      Amt: payment.order.calc_price_with_shipfee,
      ItemDesc: payment.name,
      ReturnURL: pay2go_return_url,
      NotifyURL: Pay2go.notify_url,
      Email: payment.email,
      LoginType: 0,
      CREDIT: credit,
      WEBATM: webatm,
      VACC: vacc,
      CVS: 0,
      BARCODE: 0
    }
    pay2go = Pay2go.new(pay2go_params)
    pay2go_params[:CheckValue] = pay2go.make_check_value
    pay2go_params
  end

  def shopping_cart
    current_qty = content_tag(:span,current_cart.total)
    qty = content_tag(:span,current_qty ,id:"current_qty")
    icon = content_tag(:i,nil,class:[" menu-icon","fa","fa-shopping-cart"])
    if current_user
      link_to new_order_path, class:"cart_count" do
        params[:controller]=="orders"&& params[:action] == "new" ? icon : qty+icon
      end
    else
      link_to new_session_path(:user), class:"cart_count" do
        qty+icon
      end
    end
  end

end
