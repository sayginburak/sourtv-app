class AddEksiLinkToShows < ActiveRecord::Migration
  def change
    add_column :shows, :eksi_link, :string
  end
end
