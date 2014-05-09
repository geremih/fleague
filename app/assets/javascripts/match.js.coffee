        # Place all the behaviors and hooks related to the matching controller here.
        # All this logic will automatically be available in application.js.
        # You can use CoffeeScript in this file: http://coffeescript.org/





ready= ->

        $("#random-button").click( -> randomScore())
        randomScore = ->
                $('.player-score-input').each (index, element) ->
                        $(element).val( Math.floor( 100 * Math.random()))




$(document).ready(ready)
$(document).on('page:load', ready)
