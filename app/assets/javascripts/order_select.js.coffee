disabled_option=() ->
  if $('#whoset').dropdown('get value')[0] == "本公司派專業師傅安裝"
    $('#county').siblings('.menu').children().slice(3).addClass('disabled')

$('#county').parent().one "click",->
  disabled_option()

$('#whoset').on "change", ->
  ship_fee = 0
  amount = $('#amount').html()
  final_amount = $('#final_amount').html()
  siblings = $('#county').siblings('.menu')
  items = siblings.find('.item')
  selected = siblings.find('.selected')
  ship_fee = $('#order').data('shipfee') if amount < 2000

  if $(this).find("option:selected").val() == "自行安裝（打６折）"
    amount = ($('#order').data('cartamount') * 0.6)
    $('#amount').css('text-decoration','line-through')
    $('#final_amount').html(amount+ship_fee)
    $('#discount').css('display','inline')
    items.removeClass('disabled')

  if ($(this).find("option:selected").val() == "本公司派專業師傅安裝")
    $('#amount').css('text-decoration','none')
    $('#final_amount').html($('#order').data('cartamount') + ship_fee)
    $('#discount').css('display','none')
    items.slice(3).addClass('disabled')
    if $.inArray(selected.data('value'), ["台北市" , "桃園市" , "新北市"]) == -1
      $('#county').dropdown('clear')
      $('#district').dropdown('clear')
    

