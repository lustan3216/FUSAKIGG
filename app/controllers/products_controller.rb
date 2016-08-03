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
    @current_qty = current_cart.total
    respond_to do |format|
      format.html
      format.js {render 'products/buy' }
    end
  end

  private
  def find_product
    @product = Product.find(params[:id])
  end

end
