module WelcomeHelper

  def cart_icon
    # a = content_tag(:i,"", class:["big","in","cart","icon"])
    # b = content_tag(:i,current_cart.total, class:["mini","corner","icon","red","circular","inverted"])
    # content_tag(:i,a+b ,class:["icons","cart_count"])+"購物車"
    content_tag(:i,nil,class:[" menu-icon","fa","fa-shopping-cart","fa-1x"])+"購物車"
    # + content_tag(:span,current_cart.total)
  end

end
