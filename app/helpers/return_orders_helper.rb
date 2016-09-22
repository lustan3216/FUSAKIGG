module ReturnOrdersHelper

  def return_order_header_h1
    case params[:status]
      when 'dealing'
        'DEALING'
      when 'done'
        'DONE'
      else
        'RETURN ORDER'
    end
  end

  def return_order_header_p
    case params[:status]
      when 'dealing'
        '退貨中'
      when 'done'
        '已完成'
      else
        '退貨訂單'
    end
  end
end
