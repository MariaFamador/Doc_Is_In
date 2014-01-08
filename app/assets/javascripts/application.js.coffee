#= require jquery
#= require jquery_ujs
#= require jquery.ui.datepicker
#= require turbolinks
#= require bootstrap
#= require fullcalendar
#= require_tree .


$ ->
  $('#appointments').fullCalendar
    events: '/appointments.json'
