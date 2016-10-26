ready = ->
  data_shipfee = $('#order').data('shipfee')
  data_ship_fee_boundary = $('#order').data('ship_fee_boundary')
  data_traffic_allowanc = $('#order').data('traffic_allowanc')
  data_traffic_allowanc_boundary = $('#order').data('traffic_allowanc_boundary')
  data_discount_percent = $('#order').data('discount_percent')
  data_amount = $('#order').data('amount')

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

  update_spinner_input=(command) ->
    min = 1
    max = 500
    step = 1
    product_item_input = $(this).closest('.product_item').find('#txtNum')
    val = product_item_input.val().trim();
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
    product_item_input.attr("value", num)

  update_lineitem_num=() ->
    val = $(this).closest('.product_item').find('#txtNum').val().trim();
    id = $(this).siblings('input').attr('name')
    num = if val isnt '' then parseInt(val) else 0
    $.ajax
      type: 'PUT',
      url: "/line_items",
      data:
        id: id
        qty: num

  disabled_option=() ->
    if $('#whoset').dropdown('get value')[0] == "本公司派專業師傅安裝"
      $('#county').siblings('.menu').children().slice(3).addClass('disabled')

  after_ship_fee_and_check_county=() ->
    whoset = $('#whoset')
    #    amount = $('#amount').html()
    #    final_amount = $('#final_amount').html()
    siblings = $('#county').siblings('.menu')
    items = siblings.find('.item')
    selected = siblings.find('.selected')
    ship_fee = 0
    traffic_allowanc = 0

    amount = parseInt($('#order').attr('data-cartamount'),10)

    if whoset.find("option:selected").val() == "自行安裝（打6折）"
      amount *= $('#order').data('discount_percent')
      $('#amount').css('text-decoration','line-through')
      $('#discount').css('display','inline')
      items.removeClass('disabled')
      $('#traffic_allowanc_block').hide()
      if amount < data_ship_fee_boundary
        ship_fee = $('#order').data('shipfee')

    if whoset.find("option:selected").val() == "本公司派專業師傅安裝"
      $('#amount').css('text-decoration','none')
      $('#discount').css('display','none')
      items.slice(3).addClass('disabled')
      $('#traffic_allowanc_block').show()
      if $.inArray(selected.data('value'), ["台北市" , "桃園市" , "新北市"]) == -1
        $('#county').dropdown('clear')
        $('#district').dropdown('clear')
      if amount < data_traffic_allowanc_boundary
        traffic_allowanc = data_traffic_allowanc

    amount = ship_fee + traffic_allowanc + amount

    $('#traffic_allowanc').html(traffic_allowanc)
    if ship_fee != 0
      $('#ship_status').html(ship_fee)
    else
      $('#ship_status').html("免費")
    $('#final_amount').html(amount)

  $('.order_spineer_button').on 'click', ->
    command = $(this).attr('command')
    update_spinner_input.bind(this)(command)
    item_price.bind(this)()
    price_sum()
    qty_sum()
    after_ship_fee_and_check_county()
    update_lineitem_num.bind(this)()

  $('.product_spineer_button').on 'click', ->
    command = $(this).attr('command')
    update_spinner_input.bind(this)(command)


  $('.item_cancel').on "click", ->
    product_item = $(this).closest('.product_item')
    one_price = parseInt(product_item.find('.oneprice').html(),10)
    qty = parseInt(product_item.find('#txtNum').attr("value"),10)
    price_sum(one_price,qty)
    qty_sum(qty)
    after_ship_fee_and_check_county()

  $('#whoset').on "change", ->
    after_ship_fee_and_check_county.bind(this)()

  if $('#order_whoset').html() == "自行安裝（打6折）" || $('#whoset').siblings('.menu').find('.selected').html() == "自行安裝（打6折）"
    $('#amount').css('text-decoration','line-through')
    $('#discount').css('display','inline')
    $('#traffic_allowanc_block').hide()

  $('#county').parent().one "click",->
    disabled_option()

  $('#txtNum').on 'keyup keypress',(e) ->
    keyCode = e.keyCode || e.which;
    if keyCode is 13
      e.preventDefault()
      return false

$(document).ready(ready)
