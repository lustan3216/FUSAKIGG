class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.return_order.subject
  #
  def return_order(user,order)
    @user = user
    @order = order
    mail(:to => User.first.email, :subject => "退貨訂單")
  end
end
