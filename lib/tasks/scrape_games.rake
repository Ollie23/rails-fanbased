require "open-uri"
require "nokogiri"

namespace :scrape_games do

  def premier_teams(premier_id)
      Game.destroy_all
      Competition.destroy_all
      Team.destroy_all
      team = Nokogiri::HTML(open('http://www.goal.com/en/tables/premier-league/8'))
      team.search('.short').each_with_index do |element, index|
        teamname = element.search('.team.short').each_with_index do |el, index|
          name_team = el.search('a').text.strip
          unless name_team.empty?
            premier_team = Team.create!(name: name_team, location: "England")
            Competition.create!(team_id: premier_team.id, league_id: premier_id)
            puts "fuck diego"
          end
        end
      end
    end

  task premier: :environment do
    Game.destroy_all
    premier_league = League.create(name: "Premier League", country: "England")
    premier_teams(premier_league.id)

    league = Nokogiri::HTML(open('http://www.goal.com/en/fixtures/premier-league/8'))
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
          Game.create!(date_time: new_date, league_id: premier_league.id, home_team_id: team_01.first.id, away_team_id: team_02.first.id)
        end
      end
    end
  end

  end

