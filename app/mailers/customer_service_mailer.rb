class CustomerServiceMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.customer_service_mailer.notify_service_message.subject
  #
  def service_message_notify(user,message)
    @message = message
    user ? @sign_up_or_not = '已註冊會員' : @sign_up_or_not = '非註冊會員'
    @message_time = message.created_at.in_time_zone.strftime('%F %R')
    geter = User.admins.collect(&:email).push( user.email ).uniq.join(',')
    mail(:to => geter, :subject => "FUSAKI【#{message.problem}】客服訊息")
  end
end
