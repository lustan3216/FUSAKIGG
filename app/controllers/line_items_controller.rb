class LineItemsController < ApplicationController

  def update
    @id = params[:id].gsub(/order\[/,'').to_i
    @num = params[:qty].to_i
    current_cart.update_qty(@id,@num)
  end

  def destroy
    current_cart.remove_product(params[:id])
    @item_id =  params[:id].to_i
    respond_to do |format|
      format.html
      format.js {render 'cancel' }
    end
  end
end
