// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('page:load ready', function() {
  $('#add-tag').submit(function(e) {
    e.preventDefault();
    var self = $(this)

    $.ajax({
      url: self.attr('href'),
      type: 'PATCH',
      dataType: 'script'
    })
  });

  $('#add-pledge').on('click', function(e) {
    e.preventDefault();

    var self = $(this)

    $.ajax({
      type: 'GET',
      dataType: 'script'
    })
  })
});
