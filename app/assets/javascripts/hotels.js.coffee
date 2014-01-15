# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $(".hotel-rating").raty
    path: "/assets/icons"
    readOnly: true
    noRatedMsg: "Please, comment"
    space: false
    score: ->
      $(this).attr "data-score"