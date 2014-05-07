        # Place all the behaviors and hooks related to the matching controller here.
        # All this logic will automatically be available in application.js.
        # You can use CoffeeScript in this file: http://coffeescript.org/





        $ ->
                update_team = -> $('.match-schedule-select-team-list li').each(
                        (index , element)->
                                console.log($(element).attr("data-player-id")))

                $('.match-schedule-connected').sortable
                        item: '.list-group-item'
                        connectWith: '.connected'
                        change: (event , ui) -> alert("fdsa")


                populateTeamField = (e)->
                        if  $('.match-schedule-select-team-list li').length  < 11
                                console.log  $('.select-team-list li').length
                                alert "Choose more than 11 players"
                                return false;
                        team = []
                        $('.match-schedule-select-team-list li').each((index , element)->
                                team.push $(element).attr("data-player-id"))
                        $("#match-schedule-team").val(team)
                        #alert(team)
                        return true;

                $("#random-button").click( -> randomScore())
                randomScore = ->
                        $('.player-score-input').each (index, element) ->
                                $(element).val( Math.floor( 100 * Math.random()))
                $("#match-schedule-form").submit ->
                        populateTeamField()
                        

                sortPlayers = ->
                        if $("#match-schedule-sort-button").hasClass("up")
                                up = true

                        $('#match-schedule-sort-button').toggleClass("up")
                        mylist = $('.match-schedule-remaining-players-list')
                        listitems = mylist.children('li').get()
                        listitems.sort (a , b) ->
                                if up
                                        parseFloat($(a).children('span').text()) - parseFloat($(b).children('span').text())
                                else
                                        parseFloat($(b).children('span').text()) - parseFloat($(a).children('span').text())
                                        
                        $.each listitems, (idx, itm) ->
                                mylist.append(itm)
                                        
                $('#match-schedule-sort-button').click( -> sortPlayers())
                $('.match-schedule-remaining-players-list').slimScroll height: '500px'
          

