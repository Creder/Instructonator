# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#post_tag_tokens').tokenInput '/tags.json',
    theme: 'facebook'
    prePopulate: $('#post_tag_tokens').data('load')
    preventDuplicates: true
    noResultsText: 'No result, Hit Enter to create a new tag'
  $('.jumbotron').html '<%= escape_javascript render(@steps) %>'
  $('#paginator').html '<%= escape_javascript(paginate(paginate @steps,  param_name: :page).to_s) %>'


