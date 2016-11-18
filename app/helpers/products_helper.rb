module ProductsHelper
  def show_icon(product)
    if product.name.include?("開關")
      content_tag(:i,nil,class:"fa fa-lightbulb-o")
    elsif product.name.include?("插座")
      content_tag(:i,nil,class:"fa fa-plug")
    elsif product.name.include?("電鈴")
      content_tag(:i,nil,class:"fa fa-bell-o")
    else
      content_tag(:i,nil,class:"fa fa-building")
    end
  end

  def show_random_img
    if params[:type].nil?
      image_tag "product/#{Product.all.sample.item_name}.png"
    else
      image_tag "product/#{Product.send(:"#{params[:type]}").sample.item_name}.png"
    end
  end

  def show_category_name
    case params[:type]
    when nil
      '請選擇分類'
    when 'qt'
      'QT流線型開關插座'
    when 't1'
      '1T輕觸型開關插座'
    when'fk'
      'FK典雅型開關插座'
    when 'switch'
      '全系列開關'
    when 'plug'
      '全系列插座'
    when 'air_con'
      '冷氣插座'
    when 'rest'
      '盲蓋片、電鈴、防水蓋板'
    when 'emergency'
      '緊急押扣、緊急插座'
    when 'weak_power'
      '電視、電話、網路'
    when 'arg'
      '吸頂式自動感應開關、電捲門開關'
    end

  end

end
