class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.return_order.subject
  #
  def return_order_notify(user,return_order)
    @return_time = return_order.created_at.in_time_zone.strftime('%F %R')
    @order_num = return_order.order.order_number
    @user_name = user.name
    @phone = return_order.phone
    @ps = return_order.ps
    @email = return_order.alternate_email
    @return_qty = return_order.return_qty
    @return_price = return_order.return_price
    @return_items = return_order.return_line_items
    geter = User.admins.collect(&:email).push( @email,user.email ).uniq.join(',')
    mail(:to => geter, :subject => "FUSAKI【退貨訂單】正以最快速度為您處理")
  end

  def order_paid_notify(user,order)
    @order_time = order.created_at.in_time_zone.strftime('%F %R')
    @order = order
    @user = user
    @address = order.full_address
    @qty = order.total
    @price = order.final_price
    @traffic_allowanc = order.traffic_allowanc
    @ship_fee = order.ship_fee
    @items = order.line_items
    geter = User.admins.collect(&:email).push( user.email ).uniq.join(',')
    mail(:to => geter, :subject => "FUSAKI【訂單成立明細】感謝您的購買！")
  end
end
