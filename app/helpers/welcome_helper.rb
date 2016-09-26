module WelcomeHelper

  def welcome_header_h1
    case action_name
      when 'qa'
        'Q & A'
      when 'download'
        'DOWNLOAD'
      when 'introduce'
        'INTRODUCE'
    end
  end

  def welcome_header_p
    case action_name
      when 'qa'
        '提供常見、購物、技術上的解答 如有更多問題可諮詢客服'
      when 'download'
        '下載牌價、商品目錄、線路圖'
      when 'introduce'
        '對品質的的苛求 堅持台灣製造 '
    end
  end

  def itemprop
    # case controller_name
    #   when 'welcome'
    #   "itemscope itemtype='http://schema.org/WebPage'"
    # end
    'itemscope itemtype="http://schema.org/WebPage"'.html_safe if controller_name == 'welcome' && action_name == 'index'
  end

end
