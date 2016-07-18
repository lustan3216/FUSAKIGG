class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
  end

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

  def nonpay
    @orders = current_user.orders.nonpay.page(params[:page]).per(10)
  end

  def paid
    @orders = current_user.orders.paid.page(params[:page]).per(10)
  end

  def orderdone
    @orders = current_user.orders.orderdone.page(params[:page]).per(10)
  end

  def goodsbackdone
    @return_orders = current_user.return_orders.return_done.page(params[:page]).per(10)
  end


  private

  def user_params
    params.require(:user).permit(:name, :alternate_email, :postcode, :address, :phone,:avatar)
  end
end
