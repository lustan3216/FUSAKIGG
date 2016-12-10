class ProductsController < ApplicationController
  before_action :find_product , only: [:show , :buy ]

  def index
    case params[:type]
    when 'qt' ;products = Product.qt
    when 't1' ;products = Product.t1
    when 'fk' ;products = Product.fk
    when 'switch' ;products = Product.switch
    when 'plug' ;products = Product.plug
    when 'rest' ;products = Product.rest
    when 'emergency' ;products = Product.emergency
    when 'weak_power' ;products = Product.weak_power
    when 'arg' ;products = Product.arg
    when 'air_con' ;products = Product.air_con
    else
      if params[:q]
        products = Product.ransack(params[:q]).result(distinct: true)
        @keyword = params[:q][:name_cont_all]
      else
        products = Product.all
      end
    end
    @type = params[:type]

    @products = products.page(params[:page]).per(12)
    if @products.last_page?
      @next_page = nil
    else
      @next_page = @products.next_page
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    prepare_meta_tags title: @product.name,description: @product.description
  end

  def create
  end

  def destroy

  end

  def buy
    current_cart.add_product( @product , params)
    @current_qty = current_cart.total
    @buy_now = true if params[:buy_now].class == String
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
