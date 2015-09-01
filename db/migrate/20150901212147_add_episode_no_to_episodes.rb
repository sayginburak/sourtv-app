class AddEpisodeNoToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :episode_no, :integer
  end
end
