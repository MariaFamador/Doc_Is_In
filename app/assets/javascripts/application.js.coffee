#= require jquery
#= require jquery_ujs
#= require pickadate/picker 
#= require pickadate/picker.date 
#= require pickadate/picker.time
#= require turbolinks
#= require bootstrap
#= require fullcalendar
#= require_tree .


$ ->
  $('#appointments').fullCalendar
    events: '/appointments.json'

$ ->
  $('.datepicker').pickadate({
    format: 'dddd, dd mmm, yyyy',
    formatSubmit: 'yyyy/mm/dd',
    min: true,
    max: +14,
    hiddenPrefix: 'prefix__',
    hiddenSuffix: '__suffix',
    editable: true
  })

$ ->
  $('.timepicker').pickatime({
    format: "HH:i",
    interval: 15,
    min: [8, 0],
    max: [17, 0]
    hiddenPrefix: 'prefix__',
    hiddenSuffix: '__suffix',
    editable: true
    })
