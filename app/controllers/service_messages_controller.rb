class ServiceMessagesController < ApplicationController

  def new
    @message = ServiceMessage.new
  end

  def create
    send_mail = false
    if current_user
      @message = current_user.service_messages.build(service_message_params)
    else
      @message = ServiceMessage.new(service_message_params)
    end
    ActiveRecord::Base.transaction do
      @message.save
      flash[:successful] = @message.problem
      send_mail = true
    end
    CustomerServiceMailer.service_message_notify(current_user,@message).deliver_now! if send_mail
    redirect_to :back
  end

  private

  def service_message_params
    params.require(:service_message).permit(:name, :email, :problem, :message, :phone)
  end

end
