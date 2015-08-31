class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :name
      t.string :imdb_link
      t.string :image_link
      t.string :date
      t.string :imdb_point
      t.string :last_episode_id
      t.boolean :ongoing

      t.timestamps null: false
    end
  end
end
