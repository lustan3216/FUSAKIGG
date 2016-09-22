class UsersController < ApplicationController
  before_action :authenticate_user!

  def update
    current_user.update(user_params)
    if current_user.save
      flash[:user_edit] = "修改成功"
      redirect_to :back
    else
      flash[:user_edit] = "修改失敗"
      render :edit
    end
  end

  def show
    case params[:status]
      when 'outstanding'
        @orders = current_user.orders.outstanding.page(params[:page]).per(10)
      when 'paid'
        @orders = current_user.orders.paid.page(params[:page]).per(10)
      when 'done'
        @orders = current_user.orders.orderdone.page(params[:page]).per(10)
      else
        redirect_to raise ActionController::RoutingError.new('Not Found')
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :alternate_email, :postcode, :address, :phone,:avatar)
  end
end
