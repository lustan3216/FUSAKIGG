(function() {
  var ready;

  ready = function() {
    var after_ship_fee_and_check_county, calc_construction_fee, calc_traffic_allowanc, construction_table_process, data_amount, data_ship_fee_boundary, data_shipfee, data_traffic_allowanc, data_traffic_allowanc_boundary, delete_item_in_construction_fee_detail, disabled_option, item_price, price_sum, qty_sum, show_construction_fee_themselves, update_lineitem_num, update_spinner_input;
    data_shipfee = $('#order').data('shipfee');
    data_ship_fee_boundary = $('#order').data('ship_fee_boundary');
    data_traffic_allowanc = $('#order').data('traffic_allowanc');
    data_traffic_allowanc_boundary = $('#order').data('traffic_allowanc_boundary');
    data_amount = $('#order').data('amount');
    item_price = function() {
      var one_price, product_item, qty;
      product_item = $(this).closest('.product_item');
      one_price = parseInt(product_item.find('.oneprice').html(), 10);
      qty = parseInt(product_item.find('#txtNum').attr("value"), 10);
      return product_item.find('.allprice').html(one_price * qty);
    };
    price_sum = function(delete_price, qty) {
      var sum;
      if (delete_price == null) {
        delete_price = 0;
      }
      if (qty == null) {
        qty = 0;
      }
      sum = 0;
      $('.allprice').map(function() {
        return sum += parseInt($(this).html(), 10);
      });
      sum -= delete_price * qty;
      $('#order').attr('data-cartamount', sum);
      return $('#amount').html(sum);
    };
    qty_sum = function(delete_qty) {
      var qty;
      if (delete_qty == null) {
        delete_qty = 0;
      }
      qty = 0;
      $('.count_spinner').find('#txtNum').map(function() {
        return qty += parseInt($(this).val(), 10);
      });
      qty -= delete_qty;
      return $('#total').html(qty);
    };
    update_spinner_input = function(command) {
      var max, min, num, product_item_input, step, val;
      min = 1;
      max = 500;
      step = 1;
      product_item_input = $(this).closest('.product_item').find('#txtNum');
      val = product_item_input.val().trim();
      num = val !== '' ? parseInt(val) : 0;
      switch (command) {
        case 'Up':
          if (num < max) {
            num += step;
            break;
          }
          break;
        case 'Down':
          if (num > min) {
            num -= step;
            break;
          }
      }
      return product_item_input.attr("value", num);
    };
    update_lineitem_num = function() {
      var id, input, num, val;
      input = $(this).closest('.product_item').find('input');
      val = input.val().trim();
      id = input.attr('name');
      num = val !== '' ? parseInt(val) : 0;
      return $.ajax({
        type: 'PUT',
        url: "/line_items",
        data: {
          id: id,
          qty: num
        }
      });
    };
    delete_item_in_construction_fee_detail = function() {
      var id;
      id = $(this).closest('.product_item').attr('id').replace('product_item_', '');
      return $("#construction_fee_detail tr[name='" + id + "']").remove();
    };
    calc_construction_fee = function(delete_fee) {
      var product_items, sum_up, sumup_by_our, traffic_allowanc;
      if (delete_fee == null) {
        delete_fee = 0;
      }
      product_items = $('.product_item');
      traffic_allowanc = calc_traffic_allowanc();
      sum_up = 0;
      $.each(product_items, function() {
        return sum_up += $(this).find("#txtNum").val() * $(this).data('construction-fee');
      });
      sum_up -= delete_fee;
      if ($('#whoset').find("option:selected").val() === "自行安裝" || $('#order_whoset').html() === "自行安裝") {
        sum_up = 0;
      }
      $('#construction_fee_by_our span').html(sum_up);
      sumup_by_our = traffic_allowanc + sum_up;
      return $('#construction_fee_sumup_by_our span').html(sumup_by_our);
    };
    disabled_option = function() {
      if ($('#whoset').dropdown('get value')[0] === "本公司派專業師傅安裝") {
        return $('#county').siblings('.menu').children().slice(3).addClass('disabled');
      }
    };
    after_ship_fee_and_check_county = function() {
      var amount, construction_fee_sumup, items, selected, ship_fee, siblings, traffic_allowanc, whoset;
      whoset = $('#whoset');
      siblings = $('#county').siblings('.menu');
      items = siblings.find('.item');
      selected = siblings.find('.selected');
      ship_fee = 0;
      construction_fee_sumup = 0;
      traffic_allowanc = calc_traffic_allowanc();
      amount = parseInt($('#order').attr('data-cartamount'));
      if (whoset.find("option:selected").val() === "自行安裝") {
        items.removeClass('disabled');
        if (amount < data_ship_fee_boundary) {
          ship_fee = $('#order').data('shipfee');
        }
      }
      if (whoset.find("option:selected").val() === "本公司派專業師傅安裝") {
        construction_fee_sumup = parseInt($('#construction_fee_sumup_by_our span').html());
        items.slice(3).addClass('disabled');
        if ($.inArray(selected.data('value'), ["台北市", "桃園市", "新北市"]) === -1) {
          $('#county').dropdown('clear');
          $('#district').dropdown('clear');
        }
      }
      amount = ship_fee + amount + construction_fee_sumup;
      $('#final_amount').html(amount);
      if (ship_fee !== 0) {
        return $('#ship_status').html(ship_fee);
      } else {
        return $('#ship_status').html("免費");
      }
    };
    construction_table_process = function() {
      if ($('#whoset').find("option:selected").val() === "自行安裝" || $('#order_whoset').html() === "自行安裝") {
        return $('#traffic_allowanc_block').hide();
      } else {
        return $('#traffic_allowanc_block').show();
      }
    };
    calc_traffic_allowanc = function() {
      var amount, traffic_allowanc;
      amount = parseInt($('#amount').html());
      if ($('#whoset').find("option:selected").val() === "本公司派專業師傅安裝") {
        if (amount < data_traffic_allowanc_boundary) {
          traffic_allowanc = data_traffic_allowanc;
          $('#traffic_allowanc').html(traffic_allowanc);
          return traffic_allowanc;
        } else {
          $('#traffic_allowanc').html(0);
          return 0;
        }
      } else {
        $('#traffic_allowanc').html(0);
        return 0;
      }
    };
    show_construction_fee_themselves = function() {
      var sum_up, sumup_themselves;
      sum_up = $('#construction_fee_by_our span').html();
      sumup_themselves = 3000 + (sum_up * 1.25);
      $('#construction_fee_themselves').html(sum_up * 1.25);
      return $('#construction_fee_sumup_themselves').html(sumup_themselves);
    };
    $('.order_spineer_button').on('click', function() {
      var command;
      command = $(this).attr('command');
      update_spinner_input.bind(this)(command);
      item_price.bind(this)();
      price_sum();
      qty_sum();
      update_lineitem_num.bind(this)();
      calc_construction_fee();
      after_ship_fee_and_check_county();
      return show_construction_fee_themselves();
    });
    $('.product_spineer_button').on('click', function() {
      var command;
      command = $(this).attr('command');
      return update_spinner_input.bind(this)(command);
    });
    $('.item_cancel').on("click", function() {
      var one_construction_fee, one_price, product_item, qty;
      product_item = $(this).closest('.product_item');
      one_price = parseInt(product_item.find('.oneprice').html());
      qty = parseInt(product_item.find('#txtNum').attr("value"));
      one_construction_fee = product_item.data('construction-fee');
      price_sum(one_price, qty);
      qty_sum(qty);
      calc_traffic_allowanc();
      calc_construction_fee(one_construction_fee * qty);
      after_ship_fee_and_check_county();
      show_construction_fee_themselves();
      return delete_item_in_construction_fee_detail.bind(this)();
    });
    show_construction_fee_themselves();
    $('#whoset').on("change", function() {
      calc_traffic_allowanc();
      calc_construction_fee();
      after_ship_fee_and_check_county.bind(this)();
      return show_construction_fee_themselves();
    });
    $('#county').parent().one("click", function() {
      return disabled_option();
    });
    $('#txtNum').on('keyup keypress', function(e) {
      var keyCode;
      keyCode = e.keyCode || e.which;
      if (keyCode === 13) {
        e.preventDefault();
        return false;
      }
    });
    return $('#detail_click').click(function() {
      return $('#construction_fee_detail').modal('show');
    });
  };

  $(document).ready(ready);

}).call(this);
