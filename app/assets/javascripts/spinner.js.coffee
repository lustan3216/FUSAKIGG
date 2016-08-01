$('.ui.icon.button').click ->
  command = $(this).attr('command')
  HandleUpDown(command)


HandleUpDown=(command) ->
  min = 1
  max = 500
  step = 1
  val = $('#txtNum').val().trim()
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
  $('#txtNum').attr("value",num)
  
