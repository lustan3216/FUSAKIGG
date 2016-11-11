ready = ->
  data_shipfee = $('#order').data('shipfee')
  data_ship_fee_boundary = $('#order').data('ship_fee_boundary')
  data_traffic_allowanc = $('#order').data('traffic_allowanc')
  data_traffic_allowanc_boundary = $('#order').data('traffic_allowanc_boundary')
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
    input = $(this).closest('.product_item').find('input')
    val = input.val().trim();
    id = input.attr('name')
    num = if val isnt '' then parseInt(val) else 0
    $.ajax
      type: 'PUT',
      url: "/line_items",
      data:
        id: id
        qty: num

  delete_item_in_construction_fee_detail=() ->
    id = $(this).closest('.product_item').attr('id').replace('product_item_','')
    $("#construction_fee_detail tr[name='" + id + "']").remove()

  calc_construction_fee=(delete_fee = 0) ->
    product_items = $('.product_item')
    traffic_allowanc = calc_traffic_allowanc()
    sum_up = 0
    $.each( product_items , () -> sum_up += $(this).find("#txtNum").val() * $(this).data('construction-fee') )
    sum_up -= delete_fee
    sum_up = 0 if $('#whoset').find("option:selected").val() == "自行安裝" || $('#order_whoset').html()== "自行安裝"
    $('#construction_fee_by_our span').html(sum_up)
    sumup_by_our = traffic_allowanc + sum_up
    $('#construction_fee_sumup_by_our span').html( sumup_by_our )

  disabled_option=() ->
    if $('#whoset').dropdown('get value')[0] == "本公司派專業師傅安裝"
      $('#county').siblings('.menu').children().slice(3).addClass('disabled')

  after_ship_fee_and_check_county=() ->
    whoset = $('#whoset')
    siblings = $('#county').siblings('.menu')
    items = siblings.find('.item')
    selected = siblings.find('.selected')
    ship_fee = 0
    construction_fee_sumup = 0
    traffic_allowanc = calc_traffic_allowanc()
    amount = parseInt($('#order').attr('data-cartamount'))

    if whoset.find("option:selected").val() == "自行安裝"
      if amount < data_ship_fee_boundary
        ship_fee = $('#order').data('shipfee')

    if whoset.find("option:selected").val() == "本公司派專業師傅安裝"
      construction_fee_sumup = parseInt($('#construction_fee_sumup_by_our span').html())
      items.slice(3).addClass('disabled')
      if $.inArray(selected.data('value'), ["台北市" , "桃園市" , "新北市"]) == -1
        $('#county').dropdown('clear')
        $('#district').dropdown('clear')

    amount = ship_fee + amount + construction_fee_sumup
    $('#final_amount').html(amount)
    if ship_fee != 0
      $('#ship_status').html(ship_fee)
    else
      $('#ship_status').html("免費")

  construction_table_process=() ->
    if $('#whoset').find("option:selected").val() == "自行安裝" || $('#order_whoset').html()== "自行安裝"
      $('#traffic_allowanc_block').hide()
    else
      $('#traffic_allowanc_block').show()

  calc_traffic_allowanc=() ->
    amount = parseInt($('#amount').html())
    if $('#whoset').find("option:selected").val() == "本公司派專業師傅安裝"
      if amount < data_traffic_allowanc_boundary
        traffic_allowanc = data_traffic_allowanc
        $('#traffic_allowanc').html(traffic_allowanc)
        return traffic_allowanc
      else
        $('#traffic_allowanc').html(0)
        return 0
    else
      $('#traffic_allowanc').html(0)
      return 0

  show_construction_fee_themselves=()->
    sum_up = $('#construction_fee_by_our span').html()
    sumup_themselves = 3000 + (sum_up * 1.25)
    $('#construction_fee_themselves').html(sum_up * 1.25)
    $('#construction_fee_sumup_themselves').html( sumup_themselves )


  $('.order_spineer_button').on 'click', ->
    command = $(this).attr('command')
    update_spinner_input.bind(this)(command)
    item_price.bind(this)()
    price_sum()
    qty_sum()
    update_lineitem_num.bind(this)()
    calc_construction_fee()
    after_ship_fee_and_check_county()
    show_construction_fee_themselves()

  $('.product_spineer_button').on 'click', ->
    command = $(this).attr('command')
    update_spinner_input.bind(this)(command)

  $('.item_cancel').on "click", ->
    product_item = $(this).closest('.product_item')
    one_price = parseInt(product_item.find('.oneprice').html())
    qty = parseInt(product_item.find('#txtNum').attr("value"))
    one_construction_fee = product_item.data('construction-fee')
    price_sum(one_price,qty)
    qty_sum(qty)
    calc_traffic_allowanc()
    calc_construction_fee(one_construction_fee * qty)
    after_ship_fee_and_check_county()
    show_construction_fee_themselves()
    delete_item_in_construction_fee_detail.bind(this)()

  show_construction_fee_themselves()
  
  $('#whoset').on "change", ->
    calc_traffic_allowanc()
    calc_construction_fee()
    after_ship_fee_and_check_county.bind(this)()
    show_construction_fee_themselves()

  $('#county').parent().one "click",->
    disabled_option()

  $('#txtNum').on 'keyup keypress',(e) ->
    keyCode = e.keyCode || e.which;
    if keyCode is 13
      e.preventDefault()
      return false

  $('#detail_click').click ->
    $('#construction_fee_detail').modal('show');


$(document).ready(ready)
