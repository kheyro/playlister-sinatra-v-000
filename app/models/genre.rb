class Genre < ActiveRecord::Base
  has_many  :song_genres
  has_many  :songs, through: :song_genres
  has_many  :artists, through: :songs

  def slug
    Slugifiable.slugify(self.name)
  end

  def self.find_by_slug(slug)
    @genre = Genre.where("LOWER(name) = ?", Slugifiable.unslugify(slug))
  end
end
