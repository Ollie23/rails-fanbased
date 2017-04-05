require "open-uri"
require "nokogiri"

namespace :scrape_games do
  desc "TODO"

  task premier: :environment do
    Game.destroy_all
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
          Game.create!(date_time: new_date, league_id: 4, home_team_id: team_01.first.id, away_team_id: team_02.first.id)
        end
      end
      end
    end

    task team: :environment do
      Game.destroy_all
      Competition.destroy_all
      Team.destroy_all

      team = Nokogiri::HTML(open('http://www.goal.com/en/tables/premier-league/8'))
      team.search('.short').each_with_index do |element, index|
        teamname = element.search('.team.short').each_with_index do |el, index|
          name_team = el.search('a').text.strip
          unless name_team.empty?
            Team.create!(name: name_team, location: "England")
            puts "fuck diego"
          end
        end
      end
    end

  end

