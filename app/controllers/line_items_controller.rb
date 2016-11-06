class LineItemsController < ApplicationController

  def update
    @id = params[:id].gsub(/order\[/,'').to_i
    @num = params[:qty].to_i
    current_cart.update_data(@id,@num)
  end

  def destroy
    @item_id =  params[:id].to_i
    current_cart.remove_product(@item_id)
    respond_to do |format|
      format.html
      format.js {render 'cancel' }
    end
  end
end
