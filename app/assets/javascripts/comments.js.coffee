# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $(".comment-rating").each ->
    $(this).raty
      path: "/assets/icons"
      readOnly: true
      score: ->
        $(this).attr "data-score"

  $('#star').raty
    path: '/assets/icons'
    space: false
    score: 1
    target: '#star-hint'
    scoreName: 'comment[rating]'