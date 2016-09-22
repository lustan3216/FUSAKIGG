class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_order , only: [:show, :finish, :edit, :update]

  def show
  end

  def finish
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    current_cart.update_item_qty( order_params )
    @order = Order.new( order_params.reject{|h| /\d/.match(h) } )
    @order.copy_info_to(current_user)
    @order.clone_cart_line_items_by(current_cart)
    @order.assign_attributes(user_id: current_user.id,
                             after_ship_amount: current_cart.calc_price_with_shipfee(order_params[:whoset]))
    if @order.save!
      cookies[:cart_id] = nil
      redirect_to order_path(@order)
      # else
      #   render :new
    end
  end

  def update
    @order.update_item_qty(order_params)
    @order.update(order_params.reject{|h| /\d/.match(h) })
    redirect_to order_path(@order)
  end

  def checkout_pay2go
    @order = current_user.orders.find(params[:id])
    if @order.paid?
      redirect_to :back, alert: '已付款'
    else
      @payment = Payment.create!( :order => @order, :payment_method => params[:payment_method] )
      render :layout => false
    end
  end

  def thankyou
    order = Order.find(params[:order])
    if current_user.id == order.user_id
      if order.paid?
        @order = order
      end
    else
      redirect_to root_path
    end
  end

  def face_payment
    @order = current_user.orders.find(params[:id])
    if @order.paid?
      redirect_to :back, alert: '此訂單已經付過款 請至後台查看'
    else
      @order.update( paid: 1,status:'處理中')
      @payment = Payment.find_or_create_by!( :order => @order, :payment_method => '貨到付款' )
      OrderMailer.order_paid_notify(current_user,@order).deliver_now
      redirect_to thankyou_path(order:@order.id)
    end
  end

  protected

  def find_order
    @order = current_user.orders.find(params[:id])
  end

  def order_params
    params_lists = [:name, :email,:address ,:phone ,:address,:postcode,
                    :ps,:ship_time,:whoset,:status ,:county ,:district]
    params[:order].each do |key|
      params_lists <<  key.to_sym  if /\d/.match(key)
    end
    params.require(:order).permit(params_lists)
  end

end
