class WelcomeController < ApplicationController
  def index
  end

  def download
  end

  def introduce
    OrderMailer.return_order(current_user,Order.first).deliver_now!
    raise
  end

  def qa
  end

  def contact
  end
end
