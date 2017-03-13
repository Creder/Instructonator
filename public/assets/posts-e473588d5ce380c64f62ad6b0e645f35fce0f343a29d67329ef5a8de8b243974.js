(function() {
  jQuery(function() {
    return $('#post_tag_tokens').tokenInput('/tags.json', {
      theme: 'facebook',
      prePopulate: $('#post_tag_tokens').data('load'),
      preventDuplicates: true,
      noResultsText: 'No result, Hit Enter to create a new tag'
    });
  });

}).call(this);
