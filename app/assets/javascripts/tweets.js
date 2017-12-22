// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('turbolinks:load', function() {
  $('#picker-scheduled-at').datetimepicker({
    minDate: moment().add(2, 'minutes'),
    maxDate: moment().add(30, 'days'),
    format: 'MM/DD/YYYY hh:mm A ZZ'
  });
});
