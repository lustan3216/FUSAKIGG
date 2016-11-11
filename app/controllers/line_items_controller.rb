class LineItemsController < ApplicationController

  def update
    @id = params[:id].gsub(/order\[/,'').to_i
    @num = params[:qty].to_i
    url = request.referrer
    if url && url.include?('edit')
      order_id = url.match(/(\d*)\/edit/)[1].to_i
      current_user.orders.find(order_id).update_data(@id,@num)
    elsif url && url.include?('new')
      current_cart.update_data(@id,@num)
    end
  end

  def destroy
    return if params[:id].blank?
    @item_id = params[:id].to_i
    url = request.referrer
    if url && url.include?('edit')
      order_id = url.match(/(\d*)\/edit/)[1].to_i
      current_user.orders.find(order_id).remove_product(@item_id)
    elsif url && url.include?('new')
      current_cart.remove_product(@item_id)
    end
    respond_to do |format|
      format.js { render 'cancel' }
    end
  end
end
