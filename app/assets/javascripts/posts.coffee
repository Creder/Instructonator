# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
set_positions = ->
  $('.panel.panel-default').each (i) ->

    $(this).attr 'data-pos', i + 1

    return
  return

ready = ->
  $('#post_tag_ids').chosen()

  set_positions()

  $('#steps').sortable()

  $('#steps').sortable().bind 'sortupdate', (e, ui) ->

    updated_step = []

    set_positions()

    $('.panel.panel-default').each (i) ->
      updated_step.push
        id: $(this).data('id')
        position: i + 1
      return

    $.ajax
      type: 'PUT'
      url: 'edit/sort'
      data: step: updated_step
    return
  return

$(document).ready ready

$(document).on 'page:load', ready

$(document).on 'turbolinks:load', ready
