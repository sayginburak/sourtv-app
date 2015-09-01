class AddSeasonCountToShows < ActiveRecord::Migration
  def change
    add_column :shows, :season_count, :integer
    rename_column :shows, :imdb_link, :imdb_id
    rename_column :shows, :date, :year
    remove_column :shows, :last_episode, :string
    rename_column :episodes, :imdb_link, :imdb_id

  end
end
