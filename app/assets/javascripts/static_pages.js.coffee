# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

        

$ ->
        update_team = -> $('.user-team-list li').each(
                (index , element)->
                        console.log($(element).attr("data-player-id")))

        $('.connected').sortable connectWith: '.connected'
        #$('#update-team-button').click((e)-> populateTeamField(e))
        populateTeamField = (e)->
                team = []
                $('.user-team-list li').each((index , element)->
                        console.log($(element).attr("data-player-id"))
                        team.push $(element).attr("data-player-id"))
                $("#team").val(team)
                #alert(team)
                return true;



        randomScore = ->
                $('.player-score-input').each (index, element) ->
                        $(element).val( Math.floor( 100 * Math.random()))
        $("#form").submit ->
                populateTeamField()
                
        $("#random-button").click( -> randomScore())

        sortPlayers = ->
                if $("#sort-button").hasClass("up")
                        up = true
                $('#sort-button').toggleClass("up")
                mylist = $('.remaining-players-list')
                listitems = mylist.children('li').get()
                listitems.sort (a , b) ->
                        if up
                                parseFloat($(a).children('span').text()) - parseFloat($(b).children('span').text())
                        else
                                parseFloat($(b).children('span').text()) - parseFloat($(a).children('span').text())
                                
                $.each listitems, (idx, itm) ->
                        mylist.append(itm)
                                
        $('#sort-button').click( -> sortPlayers())
        $('.remaining-players-list').slimScroll height: '500px'
  

