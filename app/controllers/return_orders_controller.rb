class ReturnOrdersController < ApplicationController

  def index
    @return_orders = current_user.return_orders.dealing.page(params[:page]).per(10)
  end

  def show
    @return_order = current_user.return_orders.find(params[:id])
    @return_line_items = @return_order.items_without_qty_zero
  end

  def new
    @return_order = ReturnOrder.new
    @order = current_user.orders.orderdone.find(params[:id])
    @return_order_check = @order.return_order
  end

  def create
    @return_order = current_user.return_orders.find_or_initialize_by(return_order_params)
    @return_order.clone_return_line_item_by(params)
    OrderMailer.return_order(current_user,@return_order).deliver_now!
    # if @return_order.save
    #   OrderMailer.return_order(current_user,@return_order).deliver_now!
    #   redirect_to user_return_order_path(id: @return_order.id)
    # end
  end

  private

  def return_order_params
    params.require(:return_order).permit(:ps, :phone,:order_id,:alternate_email)
  end
end
