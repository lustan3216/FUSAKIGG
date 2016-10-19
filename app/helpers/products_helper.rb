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

end
