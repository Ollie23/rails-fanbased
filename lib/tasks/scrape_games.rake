require "open-uri"
require "nokogiri"

namespace :scrape_games do

  def get_info(attributes)
    Game.destroy_all
    Competition.destroy_all
    Team.destroy_all
    team = Nokogiri::HTML(open(attributes[:url]))
    team.search('.short tbody tr').each_with_index do |element, index|
      name = element.at_css('.team.short a').text.strip
      if name.nil?
        return
      else
        puts "Found #{name}"
      end
      picture = element.at_css('.flag img').attribute('src')
      puts "Found picture for #{name} - #{picture}" unless picture.nil?
      unless name.empty?
        team = Team.create!(name: name, location: attributes[:country])
        Competition.create!(team_id: team.id, league_id: attributes[:id])
        puts "fuck diego"
      end
    end
  end


  task premier: :environment do
    Game.destroy_all
    premier_league = League.create(name: "Premier League", country: "England")
    get_info(id: premier_league.id, country: "England", url: "http://www.goal.com/en/tables/premier-league/8")

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
          Game.create!(date_time: new_date, league_id: premier_league.id, home_team_id: team_01.first.id, away_team_id: team_02.first.id, kickoff: time)
        end
      end
    end
  end

end

