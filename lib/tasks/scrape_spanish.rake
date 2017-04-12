require "open-uri"
require "nokogiri"

namespace :scrape_spanish do

  def liga_teams(liga_id)
      # Game.destroy_all
      # Competition.destroy_all
      # Team.destroy_all
      team = Nokogiri::HTML(open('http://www.goal.com/en/tables/primera-division/7'))
      team.search('.short').each_with_index do |element, index|
        teamname = element.search('.team.short').each_with_index do |el, index|
          name_team = el.search('a').text.strip
          unless name_team.empty?
            liga_team = Team.create!(name: name_team, location: "Spain")
            Competition.create!(team_id: liga_team.id, league_id: liga_id)
            puts "fuck diego"
          end
        end
      end
    end

  task liga: :environment do
    # Game.destroy_all
    la_liga = League.create(name: "La Liga", country: "Spain")
    liga_teams(la_liga.id)

    league = Nokogiri::HTML(open('http://www.goal.com/en/fixtures/primera-division/7'))
    league.search('.match-table').each_with_index do |element, index|
      date = element.search('.comp-date').text.strip
      new_date = Date.parse(date)
      element.search('tbody tr').each_with_index do |el, index|
        time = el.search('.status').text.strip
        home_team = el.search('.home').text.strip
        away_team = el.search('.away').text.strip

        team_01 = Team.where("name LIKE ?", "%#{home_team}%")
        team_02 = Team.where("name LIKE ?", "%#{away_team}%")


        unless team_01.empty? or team_02.empty?
          Game.create!(date_time: new_date, league_id: la_liga.id, home_team_id: team_01.first.id, away_team_id: team_02.first.id, kickoff: time)
        end
      end
    end
  end

  end


