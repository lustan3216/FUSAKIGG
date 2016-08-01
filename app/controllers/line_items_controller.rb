class LineItemsController < ApplicationController

  def destroy
    current_cart.remove_product(params[:id])
    @item_id =  params[:id].to_i

    respond_to do |format|
      format.html
      format.js {render 'cancel'}
    end
    # if params[:page]=="new"
    # elsif params[:page]=="show"
    #   order = current_user.orders.find(params[:order_id])
    #   order.remove_product(params[:id])
    #   order.line_items.blank? ? (redirect_to nonpay_user_path) : (redirect_to :back)
    # end
  end
end
