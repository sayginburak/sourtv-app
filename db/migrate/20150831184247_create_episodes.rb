class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :name
      t.string :image_link
      t.string :airdate
      t.string :imdb_link
      t.string :imdb_point
      t.integer :season_no
      t.belongs_to :show

      t.timestamps null: false
    end
  end
end
