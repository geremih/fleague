# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



team_list ={ "Chennai Super Kings"=> [
"Suresh Raina",
"Mithun Manhas",
"Faf du Plessis",
"Baba Aparajith",
"Ravindra Jadeja",
"Vijay Shankar",
"Dwayne Bravo",
"Dwayne Smith",
"John Hastings",
"Mahendra Singh Dhoni",
"Brendon McCullum",
"Ashish Nehra",
"Mohit Sharma",
"Ishwar Pandey",
"Ronit More",
"Ben Hilfenhaus",
"Pawan Negi",
"Matt Henry",
"Samuel Badree",
"Ravichandran Ashwin"],

"Delhi Daredevils"=>[
"Mayank Agarwal",
"JP Duminy",
"Kedar Jadhav",
"Kevin Pietersen",
"Milind Kumar",
"Ross Taylor",
"Manoj Tiwary",
"Saurabh Tiwary",
"Murali Vijay",
"Jimmy Neesham",
"Laxmi Ratan Shukla",
"Vijaya Parthiban",
"Dinesh Karthik",
"Quinton de Kock",
"Nathan Coulter-Nile",
"Siddarth Kaul",
"Shahbaz Nadeem",
"Wayne Parnell",
"Mohammed Shami",
"HS Sharath",
"Rahul Sharma",
"Rahul Shukla",
"Jaydev Unadkat"],



"Kings XI Punjab"=>[
"Virender Sehwag",
"Cheteshwar Pujara",
"David Miller",
"Mandeep Singh",
"Shaun Marsh",
"George Bailey",
"Gurkeerat Singh",
"Manan Vohra",
"Rishi Dhawan",
"Glenn Maxwell",
"Akshar Patel",
"Thisara Perera",
"Wriddhiman Saha",
"Lakshmipathy Balaji",
"Murali Kartik",
"Anureet Singh",
"Parvinder Awana",
"Mitchell Johnson",
"Beuran Hendricks",
"Sandeep Sharma",
"Karanveer Singh",
"Shardul Thakur",
"Shivam Sharma"],


"Kolkata Knight Riders"=>[
"Gautam Gambhir ",
"Robin Uthappa",
"Manish Pandey",
"Suryakumar Yadav",
"Chris Lynn",
"Jacques Kallis",
"Andre Russell",
"Ryan ten Doeschate",
"Shakib Al Hasan",
"Yusuf Pathan",
"Sayan Sekhar Mondal",
"Debabrata Das",
"Manvinder Bisla",
"Morne Morkel",
"Patrick Cummins",
"Umesh Yadav",
"Ranganath Vinay Kumar",
"Veer Pratap Singh",
"Piyush Chawla",
"Kuldeep Yadav",
"Sunil Narine"],

"Mumbai Indians"=>[
"Rohit Sharma",
"Ambati Rayudu",
"Apoorv Vijay Wankhade",
"Michael Hussey",
"Corey Anderson",
"Kieron Pollard",
"Jalaj Saxena",
"Sushant Marathe",
"CM Gautam",
"Aditya Tare",
"Ben Dunk",
"Zaheer Khan",
"Harbhajan Singh",
"Shreyas Gopal",
"Jasprit Bumrah",
"Marchant de Lange",
"Josh Hazlewood",
"Krishmar Santokie",
"Pragyan Ojha",
"Pawan Suyal",
"Lasith Malinga"],

"Rajasthan Royals"=>[
"Karun Nair",
"Ajinkya Rahane",
"Brad Hodge",
"Unmukt Chand",
"Shane Watson",
"James Faulkner",
"Stuart Binny",
"Kevon Cooper",
"Rajat Bhatia",
"Abhishek Nayar",
"Steve Smith",
"Sanju Samson",
"Ankush Bains",
"Dishant Yagnik",
"Pravin Tambe",
"Amit Mishra",
"Dhawal Kulkarni",
"Kane Richardson",
"Deepak Hooda",
"Ben Cutting",
"Iqbal Abdulla",
"Tim Southee",
"Rahul Tewatia",
"Vikramjeet Malik",
"Ankit Sharma"], 

"Royal Challengers Bangalore"=>[
"Virat Kohli ",
"Tanmay Mishra",
"Nic Maddinson",
"Vijay Zol",
"Chris Gayle",
"Yuvraj Singh",
"Sachin Rana",
"Albie Morkel",
"Parthiv Patel",
"Yogesh Takawale",
"AB de Villiers",
"Ashok Dinda",
"Varun Aaron",
"Abu Nechim",
"Shadab Jakati",
"Yuzvendra Chahal",
"Sandeep Warrier",
"Harshal Patel",
"Ravi Rampaul",
"Mitchell Starc",
"Muttiah Muralitharan"],


"Sunrisers Hyderabad"=>[
"Aaron Finch",
"Shikhar Dhawan",
"David Warner",
"Venugopal Rao",
"Manpreet Juneja",
"Ricky Bhui",
"Srikkanth Anirudha",
"Karn Sharma",
"Irfan Pathan",
"Darren Sammy ",
"Moisés Henriques",
"Parvez Rasool",
"Naman Ojha",
"Lokesh Rahul",
"Amit Paunikar",
"Brendan Taylor",
"Ishant Sharma",
"Ashish Reddy",
"Dale Steyn",
"Bhuvneshwar Kumar",
"Chama Milind",
"Jason Holder",
"Prasanth Parameswaran"]
}

team_list.each do |name , players|
  team = LeagueTeam.create( name: name)
  players.each do |p|
    team.players.create( name: p ) 
    end
end


50.times{ User.create( email: Faker::Internet.email, password:"password" , password_confirmation: "password")}



15.times do
  match = Match.new
  range = (1..LeagueTeam.count).to_a.shuffle
  match.team1 = LeagueTeam.find(range[0])
  match.team2 = LeagueTeam.find(range[1])
  match.save

  
  5.times do
    players =   match.players.shuffle.take(11)
    user = User.find((1..User.count).to_a.sample)
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
    team.save
    user.save
  end
  
  for player in match.players
    record = PlayerMatchRecord.find_by match_id: match.id ,  player_id: player.id
    record.score = (1..100).to_a.sample
    record.save
  end
  match.completed = true
  match.save
end
