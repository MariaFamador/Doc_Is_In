#= require jquery
#= require jquery.turbolinks
#= require jquery_ujs
#= require jquery.ui.all
#= require bootstrap
#= require pickadate/picker
#= require pickadate/picker.date 
#= require pickadate/picker.time
#= require fullcalendar
#= require select2
#= require turbolinks
#= require_tree .

ready = ->
  $('#appointments').fullCalendar
    height: 550
    allDayDefault: false
    slotEventOverlap: false
    defaultEventMinutes: 51
    slotMinutes: 5
    editable: true
    events: '/appointments.json'
    header: {
      left: 'prev, next',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
    }
    dragOpacity: {
      '': .5
    }
    minTime: 8
    maxTime: 18

    eventClick: (event) ->
      if (event.url) 
        window.open(event.url, _self)


  $('.datepicker').pickadate
    format: 'dddd, dd mmm, yyyy'
    formatSubmit: 'yyyy/mm/dd'
    min: true
    max: +14
    hiddenPrefix: 'prefix__'
    hiddenSuffix: '__suffix'
    editable: true

  $('.timepicker').pickatime
    format: "HH:i"
    interval: 15
    min: [8, 0]
    max: [17, 0]
    hiddenPrefix: 'prefix__'
    hiddenSuffix: '__suffix'
    editable: true

  $('.select2').each ->
    $(@).select2
      placeholder: "Please select..."
      closeOnSelect: false

$(document).ready(ready)

