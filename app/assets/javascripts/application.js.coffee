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
    height: 600
    allDayDefault: false
    slotEventOverlap: false
    defaultEventMinutes: 15
    slotMinutes: 5
    editable: true
    events: '/calendar.json'
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

  $('.form-select').select2
      placeholder: "Please select..."
      closeOnSelect: false



  $('.select2').select2
      placeholder: "Please select..."
      closeOnSelect: false
  if $('.nav-tabs')
    $('.nav-tabs a').on 'shown.bs.tab', (e)->
      tab = $(e.target).attr('href')
      if window.location.search.length == 0
        window.location.hash = tab

  hash = window.location.hash
  search = window.location.search
  if hash
    tab_hash = hash.split('#')[1]
    $("a[href=##{tab_hash}]").tab('show')

  else if search
    tab_search = search.split('=')[1]
    $("a[href=##{tab_search}]").tab('show')

$(document).ready(ready)
