require "open-uri"
require "nokogiri"

namespace :scrape_dutch do


  def get_info(attributes)
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
        team = Team.create!(name: name, location: attributes[:country], remote_photo_url: picture)
        Competition.create!(team_id: team.id, league_id: attributes[:id])
        puts "fuck diego"
      end
    end
  end


  task eredivisie: :environment do
    eredivisie = League.create(name: "Eredivisie", country: "Netherlands")
    get_info(id: eredivisie.id, country: "Netherlands", url: "http://www.goal.com/en/tables/eredivisie/1")

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


