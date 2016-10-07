ready = ->
  item_price=() ->
    product_item = $(this).closest('.product_item')
    one_price = parseInt(product_item.find('.oneprice').html(),10)
    qty = parseInt(product_item.find('#txtNum').attr("value"),10)
    product_item.find('.allprice').html(one_price * qty)

  price_sum=(delete_price = 0,qty = 0) ->
    sum = 0
    $('.allprice').map ->
      sum += parseInt($(this).html(),10)
    sum -= (delete_price*qty)
    $('#order').attr('data-cartamount',sum)
    $('#amount').html(sum)

  qty_sum=(delete_qty = 0) ->
    qty = 0
    $('.count_spinner').find('#txtNum').map ->
      qty += parseInt($(this).val(),10)
    qty -= delete_qty
    $('#total').html(qty)

  HandleUpDown=(command) ->
    min = 1
    max = 500
    step = 1
    product_item = $(this).closest('.product_item')
    val = product_item.find('#txtNum').val().trim();
    num = if val isnt '' then parseInt(val) else 0
    switch command
      when 'Up'
        if (num < max)
          num += step
          break
      when 'Down'
        if (num > min)
          num -= step
          break
    product_item.find('#txtNum').attr("value", num)
    id = window.location.href.replace( /http.*products\//, '')
    $.ajax
      type: 'PUT',
      url: "/line_items",
      data:
        id: id
        qty: num

  disabled_option=() ->
    if $('#whoset').dropdown('get value')[0] == "本公司派專業師傅安裝"
      $('#county').siblings('.menu').children().slice(3).addClass('disabled')

  after_ship_fee=() ->
    whoset = $('#whoset')
    #    amount = $('#amount').html()
    #    final_amount = $('#final_amount').html()
    siblings = $('#county').siblings('.menu')
    items = siblings.find('.item')
    selected = siblings.find('.selected')
    ship_fee = $('#order').data('shipfee')
    amount = parseInt($('#order').attr('data-cartamount'),10)

    if whoset.find("option:selected").val() == "自行安裝（打６折）"
      amount *= 0.6
      $('#amount').css('text-decoration','line-through')
      $('#discount').css('display','inline')
      items.removeClass('disabled')

    if whoset.find("option:selected").val() == "本公司派專業師傅安裝"
      $('#amount').css('text-decoration','none')
      $('#discount').css('display','none')
      items.slice(3).addClass('disabled')
      if $.inArray(selected.data('value'), ["台北市" , "桃園市" , "新北市"]) == -1
        $('#county').dropdown('clear')
        $('#district').dropdown('clear')
    if amount < 2000
      amount += ship_fee
      $('#ship_status').html(ship_fee)
    else
      $('#ship_status').html("免費")
    $('#final_amount').html(amount)

  $('.ui.icon.button').on 'click', ->
    command = $(this).attr('command')
    HandleUpDown.bind(this)(command)
    item_price.bind(this)()
    price_sum()
    qty_sum()
    after_ship_fee()

  $('.item_cancel').on "click", ->
    product_item = $(this).closest('.product_item')
    one_price = parseInt(product_item.find('.oneprice').html(),10)
    qty = parseInt(product_item.find('#txtNum').attr("value"),10)
    price_sum(one_price,qty)
    qty_sum(qty)
    after_ship_fee()

  $('#whoset').on "change", ->
    after_ship_fee.bind(this)()

  $('#county').parent().one "click",->
    disabled_option()

$(document).ready(ready)
