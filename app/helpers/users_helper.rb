module UsersHelper
  def user_header_h1
    case params[:status]
      when 'outstanding'
        'OUTSTANDING'
      when 'done'
        'DONE'
      when 'paid'
        'PAID'
    end
  end

  def user_header_p
    case params[:status]
      when 'outstanding'
        '未付款'
      when 'done'
        '已完成'
      when 'paid'
        '已付款'
    end
  end
end
