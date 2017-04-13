require "open-uri"
require "nokogiri"

namespace :scrape_dutch do

  def eredivisie_teams(eredivisie_id)
      # Game.destroy_all
      # Competition.destroy_all
      # Team.destroy_all
      team = Nokogiri::HTML(open('http://www.goal.com/en/tables/eredivisie/1'))
      team.search('.short').each_with_index do |element, index|
        teamname = element.search('.team.short').each_with_index do |el, index|
          name_team = el.search('a').text.strip
          unless name_team.empty?
            eredivisie_team = Team.create!(name: name_team, location: "Netherlands")
            Competition.create!(team_id: eredivisie_team.id, league_id: eredivisie_id)
            puts "fuck diego"
          end
        end
      end
    end

  task eredivisie: :environment do
    # Game.destroy_all
    eredivisie = League.create(name: "Eredivisie", country: "Netherlands")
    eredivisie_teams(eredivisie.id)

    league = Nokogiri::HTML(open('http://www.goal.com/en/fixtures/eredivisie/1'))
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
          Game.create!(date_time: new_date, league_id: eredivisie.id, home_team_id: team_01.first.id, away_team_id: team_02.first.id, kickoff: time)
        end
      end
    end
  end

  end


