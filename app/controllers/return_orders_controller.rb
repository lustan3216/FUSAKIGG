class ReturnOrdersController < ApplicationController

  def index
    @return_orders = current_user.return_orders.dealing.page(params[:page]).per(10)
  end

  def show
    @return_order = current_user.orders.find(params[:id])
    @order = current_user.orders.orderdone.find(params[:id])
    @return_order_check = @order.return_order
  end

  def new
    @return_order = ReturnOrder.new
    @order = current_user.orders.orderdone.find(params[:id])
    @return_order_check = @order.return_order
  end

  def create
    @return_order = current_user.return_orders.find_or_initialize_by(order_id: params[:return_order][:order_id],status:"處理中")
    @return_order.assign_attributes( phone: params[:return_order][:phone] ,ps: params[:return_order][:ps])
    @return_order.clone_return_line_item_by(params)
    if @return_order.save
      redirect_to :back
    end
  end

  # private
  #
  # def return_order_params
  #   params.require(:return_order).permit(:ps, :phone,:status, return_line_items_attributes: [:qty])
  # end
end
