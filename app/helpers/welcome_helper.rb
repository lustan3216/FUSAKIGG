module WelcomeHelper

  def cart_icon
    # a = content_tag(:i,"", class:["big","in","cart","icon"])
    # b = content_tag(:i,current_cart.total, class:["mini","corner","icon","red","circular","inverted"])
    # + content_tag(:span,current_cart.total)
    # +content_tag(:div,current_cart.total ,class:["ui","label"])
    content_tag(:i,nil,class:[" menu-icon","fa","fa-shopping-cart"])+"購物車"
  end

end
