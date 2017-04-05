Competition.destroy_all
League.destroy_all
Team.destroy_all


league = League.create(name: "Premier League", country: "England")
liga = League.create(name: "La Liga ", country: "Spain")
ligue = League.create(name: "Ligue 1", country: "France")


team = Team.create(
  name: "Tottenham Hotspur" , location: "London"
)
Competition.create(team: team, league: league)
team1 = Team.create(
  name: "Chelsea" , location: "London"
)
Competition.create(team: team1, league: league)
team2 = Team.create(
  name: "Liverpool" , location: "Liverpool"
)
Competition.create(team: team2, league: league)
team3 = Team.create(
  name: "Manchester City" , location: "Manchester"
)
Competition.create(team: team3, league: league)
team4 = Team.create(
  name: "Manchester United" , location: "Manchester"
)
Competition.create(team: team4, league: league)
team5 = Team.create(
  name: "Arsenal" , location: "London"
)
Competition.create(team: team5, league: league)
team6 = Team.create(
  name: "Everton" , location: "Liverpool"
)
Competition.create(team: team6, league: league)
team7 = Team.create(
  name: "West Brom" , location: "Birmingham"
)
Competition.create(team: team7, league: league)
team8 = Team.create(
  name: "Swansea" , location: "Swansea"
)
Competition.create(team: team8, league: league)
team9 = Team.create(
  name: "Southampton" , location: "Southampton"
)
Competition.create(team: team9, league: league)
team10 = Team.create(
  name: "Middlesborough" , location: "Middlesborough"
)
Competition.create(team: team10, league: league)
team11 = Team.create(
  name: "Hull City" , location: "Hull"
)
Competition.create(team: team11, league: league)
team12 = Team.create(
  name: "Stoke City" , location: "Stoke"
)
Competition.create(team: team12, league: league)
team13 = Team.create(
  name: "Sunderland" , location: "Newcastle"
)
Competition.create(team: team13, league: league)
team14 = Team.create(
  name: "Leicester City" , location: "Leicester"
)
Competition.create(team: team14, league: league)
team15 = Team.create(
  name: "Burnley" , location: "Burnley"
)
Competition.create(team: team15, league: league)
team16 = Team.create(
  name: "Crystal Palace" , location: "London"
)
Competition.create(team: team16, league: league)
team17 = Team.create(
  name: "West Ham United" , location: "London"
)
Competition.create(team: team17, league: league)
team18 = Team.create(
  name: "Watford" , location: "London"
)
Competition.create(team: team18, league: league)
team19 = Team.create(
  name: "Bournemouth" , location: "Bournemouth"
)
Competition.create(team: team19, league: league)




team20 = Team.create(
  name: "Real Madrid" , location: "Madrid"
)
Competition.create(team: team20, league: liga)
team21 = Team.create(
  name: "Barcelona" , location: "Barcelona"
)
Competition.create(team: team21, league: liga)
team22 = Team.create(
  name: "Atletico Madrid" , location: "Madrid"
)
Competition.create(team: team22, league: liga)
team23 = Team.create(
  name: "Sevilla" , location: "Sevilla"
)
Competition.create(team: team23, league: liga)
team24 = Team.create(
  name: "Espanyol" , location: "Barcelona"
)
Competition.create(team: team24, league: liga)
team25 = Team.create(
  name: "Real Sociedad" , location: "San Sebastián"
)
Competition.create(team: team25, league: liga)
team26 = Team.create(
  name: "Valencia" , location: "Valencia"
)
Competition.create(team: team26, league: liga)
team27 = Team.create(
  name: "Getafe CF" , location: "Getafe"
)
Competition.create(team: team27, league: liga)
team28 = Team.create(
  name: "Athletic Bilbao" , location: "Bilbao"
)
Competition.create(team: team28, league: liga)
team29 = Team.create(
  name: "Villareal" , location: "Villareal"
)


team30 = Team.create(
  name: "PSG" , location: "Paris"
)
Competition.create(team: team30, league: ligue)
team31 = Team.create(
  name: "Olympique Marseille" , location: "Marseilla"
)
Competition.create(team: team31, league: ligue)
team32 = Team.create(
  name: "Monaco" , location: "Monaco"
)
Competition.create(team: team32, league: ligue)
team33 = Team.create(
  name: "Olympique Lyon" , location: "Lyon"
)
Competition.create(team: team33, league: ligue)
team34 = Team.create(
  name: "AS Saint-Étienne" , location: "Saint-Étienne"
)
Competition.create(team: team34, league: ligue)
team35 = Team.create(
  name: "Real Sociedad" , location: "San Sebastián"
)
Competition.create(team: team35, league: ligue)
team36 = Team.create(
  name: "Bordeaux" , location: "Bordeaux"
)
Competition.create(team: team36, league: ligue)
team37 = Team.create(
  name: "Toulouse" , location: "Toulouse"
)
Competition.create(team: team37, league: ligue)
team38 = Team.create(
  name: "Stade Rennais F.C." , location: "Rennes"
)
Competition.create(team: team38, league: ligue)
team39 = Team.create(
  name: "OGC Nice" , location: "Nice"
)
Competition.create(team: team39, league: ligue)
