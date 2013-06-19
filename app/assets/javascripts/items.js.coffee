# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  do_search = ->
    request = $.ajax(
      type: "POST"
      url: "/search/ajax_item"
      data: $(".search_term").serialize()
      complete: ->
        $("#myTable tbody").html()

      success: (data) ->
        $("#myTable tbody").html data
        $("table").trigger "update"
        sorting = [[0, 0], [0, 0]]
        $("table").trigger "sorton", [sorting]
    )

  $("table").tablesorter(
    widthFixed: true
    widgets: ["zebra"]
  ).tablesorterPager container: $("#pager")
  $("#search_form").submit ->
    false

  $("#search_btn").click ->
    do_search()

#numberOfMonths: 2,
$("#start_date").datepicker onSelect: (selected) ->
  $("#end_date").datepicker "option", "minDate", selected


#numberOfMonths: 2,
$("#end_date").datepicker onSelect: (selected) ->
  $("#start_date").datepicker "option", "maxDate", selected