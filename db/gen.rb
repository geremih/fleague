
flag = false
10.times do
  match = Match.new
  range = (1..LeagueTeam.count).to_a.shuffle
  match.team1 = LeagueTeam.find(range[0])
  match.team2 = LeagueTeam.find(range[1])
  if not match.save
    puts "ERROR"
    break
  end
  
  10.times do
    if flag
      break
    end
    players =   match.players.shuffle.take(11)
    user = User.find( (1..User.count).to_a.sample)
    puts user.email
    puts user.id
    puts match.id
    if  !user.teams.where(match_id: match.id).empty?
      puts "exists"
      next
    end
    team = user.teams.create
    players.each { |p|  team.players << p }
    team.match_id = match.id
    if not team.save
      puts team.errors.inspect
      raise "ERROR"
      flag = true
      break
    end
    puts "TEAM"
    puts team.players

    if not user.save
      puts user.errors.inspect
      flag =true
      raise "ERROR"
      break
    end
  end


  
end
