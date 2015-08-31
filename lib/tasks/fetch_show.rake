require 'nokogiri'
require 'open-uri'
namespace :imdb_fetch do
  desc "Fetch show and episode details from imdb"
  task :show => :environment do
    base_url = "http://www.imdb.com"
    path = "/title/tt0773262/"
    html = Nokogiri::HTML(open(base_url+path))
    seasons_array = html.css('.seasons-and-year-nav').css('div')[3].css('a')
    seasons = seasons_array.map do |s| 
      { :no   =>  s.text,
        :link =>  s['href'],
      }
    end

    data = {}

    seasons.each_with_index do |s, j| 
      season_no = (s[:no]).to_s.to_sym
      season_html = Nokogiri::HTML(open(base_url+s[:link]))
      data[season_no] = {}
      
      season_html.css('.eplist').css('.list_item').each_with_index do |item,i|
        episode_no = (i+1).to_s.to_sym
        data[season_no][episode_no] = {}
        data[season_no][episode_no][:image] = item.css('.image').css('a').first['href']
        data[season_no][episode_no][:name] = item.css('.info').css('strong').css('a').first.text
        data[season_no][episode_no][:air_date] = item.css('.info').css('.airdate').first.text.strip.gsub(/\s+/, " ")
      end
    end
    puts Show.inspect
  end
end