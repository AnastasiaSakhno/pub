function getUrlVars() {
  var vars = {}
  var parts = decodeURI(window.location.href)
    .replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) { vars[key] = value })
  return vars
}

$(document).ready(function(){
  $('.datepicker').datepicker({
    startDate: new Date(),
    format: "dd-mm-yyyy",
    weekStart: 1,
    multidate: true,
    language: 'ua'
  })

  var selectedDates = decodeURIComponent(getUrlVars()['search[date]'])
  if (selectedDates !== 'undefined') {
    $('.datepicker').val(selectedDates)
  }
})