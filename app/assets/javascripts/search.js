$(document).ready(function(){
  $('#search_input').on('keypress',function (e) {
    if (e.which == 13) {
      document.getElementById('product_search').submit();
      return false;
    }
  })
})

