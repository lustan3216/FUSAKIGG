class Pay2goController < ApplicationController

  skip_before_action :verify_authenticity_token

  def return
    result = nil
    ActiveRecord::Base.transaction do
      @payment = Payment.find_and_process( json_data )
      result = @payment.save
    end
    unless result
      flash[:alert] = t("registration.error.failed_pay")
    end
    @order = @payment.order
    if @payment.paid?
      ActiveRecord::Base.transaction do
        @order.paid = true
        @order.status = "處理中"
        @order.payment_status = "完成"
        @order.save!
        OrderMailer.order_paid_notify(current_user,@order).deliver_later!
      end
    end
    redirect_to thankyou_path(:order => @order)
  end

  def notify
    result = nil
    ActiveRecord::Base.transaction do
      @payment = Payment.find_and_process( json_data )
      result = @payment.save
    end
    unless result
      flash[:alert] = t("registration.error.failed_pay")
    end
    @order = @payment.order
    if @payment.paid?
      ActiveRecord::Base.transaction do
        @order.paid = true
        @order.status = "處理中"
        @order.payment_status = "完成"
        @order.save!
        OrderMailer.order_paid_notify(current_user,@order).deliver_later!
      end
    end
    redirect_to thankyou_path(:order => @order)
  end

  private

  def json_data
    JSON.parse( params["JSONData"] )
  end

end
