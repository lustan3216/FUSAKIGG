class ServiceMessagesController < ApplicationController

  def new
    @message = ServiceMessage.new
  end

  def create
    current_user ? @message = current_user.service_messages.build(service_message_params) : @message = ServiceMessage.new(service_message_params)
    if @message.save
      flash[:successful] = @message.problem
      CustomerServiceMailer.service_message_notify(current_user,@message).deliver_later!
      redirect_to :back
    end
  end

  private

  def service_message_params
    params.require(:service_message).permit(:name, :email, :problem, :message, :phone)
  end

end
