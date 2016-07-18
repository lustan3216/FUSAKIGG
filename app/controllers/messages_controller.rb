class MessagesController < ApplicationController
  def create
    current_user ? @message = current_user.messeges.build(messege_params) : @message = Message.new(messege_params)
    byebug
    admin_id = User.find_by_email("fusakihome@gmail.com").id
    @message.friend_id = admin_id
    byebug
    if @message.save
    render "welcome/contact"
    end
  end

  private
  def messege_params
    params.require(:message).permit(:name, :email, :problem, :friend_id, :message,:phone)
  end
end
