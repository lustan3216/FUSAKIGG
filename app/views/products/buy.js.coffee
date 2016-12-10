$('#current_qty').html('<%= @current_qty %>');
<% if @buy_now %>
window.location.replace("<%= new_order_path %>");
<% end %>