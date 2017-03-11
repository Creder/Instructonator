ready = ->

  $('#steps').sortable
    update: ->
      $.post('steps/sort', $(this).sortable('serialize'))
      

$(document).ready ready

$(document).on 'page:load', ready

$(document).on 'turbolinks:load', ready