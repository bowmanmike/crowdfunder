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

  $(document).on('submit', '#new_pledge', function(e) {
    e.preventDefault();
    var self = $(this)

    $.ajax({
      url: self.attr('action'),
      type: self.attr('method'),
      dataType: 'html',
      data: self.serialize(),
      success: function(data) {
        console.log(data)
        $('#total-pledges').html('<%=j @project.pledges.all.sum(:amount) %>');
        $('#distance-to-goal').html('<%=j @project.funding_goal - @project.pledges.all.sum(:amount) %>');
      }
    })
  });

});
