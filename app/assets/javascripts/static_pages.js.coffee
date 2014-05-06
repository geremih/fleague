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
        $("#form").submit ->
                populateTeamField()
                
        
        


