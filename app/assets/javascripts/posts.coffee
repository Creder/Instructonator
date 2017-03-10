# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
 $('#post_tag_ids').chosen()
 $('#steps').sortable()
  axis: "y"

$(document).ready(ready)
$(document).on('page:load', ready)
$(document).on("turbolinks:load", ready) 