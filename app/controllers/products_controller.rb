class ProductsController < ApplicationController
  before_action :find_product , only: [:show , :buy ]

  def index
    if params[:type] == "qt"
      @products = Product.qt
    elsif params[:type] == "t1"
      @products = Product.t1
    elsif params[:type] == "switch"
      @products = Product.switch
    elsif params[:type] == "plug"
      @products = Product.plug
    elsif params[:type] == "rest"
      @products = Product.rest
    else
      @products = Product.all
    end
  end

  def show
  end

  def create

  end

  def destroy

  end

  def buy
    current_cart.add_product( @product, params[:qty].to_i ,params[:voltage])
    redirect_to :back
  end

  def cancel
    if params[:page]=="new"
      current_cart.remove_product(params[:id])
      redirect_to :back
    elsif params[:page]=="show"
      order = current_user.orders.find(params[:order_id])
      order.remove_product(params[:id])
      order.line_items.blank? ? (redirect_to nonpay_user_path) : (redirect_to :back)
    end
  end

  private
  def find_product
    @product = Product.find(params[:id])
  end

end
