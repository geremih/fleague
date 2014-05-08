# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

        
ready= ->
        update_team = -> $('.user-team-list li').each(
                (index , element)->
                        console.log($(element).attr("data-player-id")))

        $('.connected').sortable
                item: '.list-group-item'
                connectWith: '.connected'
                change: (event , ui) -> alert("fdsa")

        $('.connected').sortable 
        populateTeamField = (e)->
                if  $('.user-team-list li').length != 11
                        alert "Choose 11 players"
                        return false;
                team = []
                $('.user-team-list li').each((index , element)->
                        console.log($(element).attr("data-player-id"))
                        team.push $(element).attr("data-player-id"))
                $("#team").val(team)
                #alert(team)
                return true;

        $("#random-button").click( -> randomScore())
        randomScore = ->
                $('.player-score-input').each (index, element) ->
                        $(element).val( Math.floor( 100 * Math.random()))
        $("#form").submit ->
                populateTeamField()
                

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
        $('.remaining-players-list').slimScroll height: '462px'
        $("#form").on "ajax:success", (e, data, status, xhr) ->
                $("#alert-success").text("Updated")
                $("#alert-success").show().delay(2000).fadeOut();
        $("#form").on "ajax:error", (e ,data, status ,xhr) ->
                $("#alert-danger").text("Error")
                $("#alert-danger").show().delay(2000).fadeOut();
        


            
        
  
$(document).ready(ready)
$(document).on('page:load', ready)
