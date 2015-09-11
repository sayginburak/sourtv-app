namespace :imdb_fetch do
  desc "Fetch show and episode details from imdb"
  task :show => :environment do
      serie_name = "Dexter"
      show = Show.new
      show.name = serie_name
      id = Imdb::Search.new(serie_name).movies.first.id
      show.imdb_id = id
      serie = Imdb::Serie.new(id)
      show.year = serie.year
      show.image_link = serie.poster
      show.imdb_point = serie.rating
      show.season_count = serie.seasons.count
      show.save

      show.season_count.times do |i|
        season = serie.season(i+1)
        season.episodes.each do |e|
          ep = show.episodes.new
          episode = e
          ep.imdb_id = episode.id
          ep.name = episode.title
          ep.image_link = episode.poster
          ep.airdate = episode.air_date
          ep.imdb_point = episode.rating
          ep.season_no = episode.season
          ep.episode_no = episode.episode
          ep.save
        end
      end

  end
end