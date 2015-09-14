class Show < ActiveRecord::Base
  has_many :episodes

  def imdb_link
    "http://www.imdb.com/title/tt#{imdb_id}/"
  end
end
