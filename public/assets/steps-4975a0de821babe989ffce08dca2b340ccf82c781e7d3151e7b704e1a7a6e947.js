(function() {
  var ready;

  ready = function() {
    return $('#steps').sortable({
      update: function() {
        return $.post('steps/sort', $(this).sortable('serialize'));
      }
    });
  };

  $(document).ready(ready);

  $(document).on('page:load', ready);

  $(document).on('turbolinks:load', ready);

}).call(this);
