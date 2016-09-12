class UsersController < ApplicationController
  before_action :authenticate_user!

  # def edit
  #   render_404
  # end

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

  private

  def user_params
    params.require(:user).permit(:name, :alternate_email, :postcode, :address, :phone,:avatar)
  end
end
