class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.downcase.gsub(/[ ]/, "-")
  end

  def self.find_by_slug(slug)
    self.find_by(name: slug.split("-").map {|x| x.capitalize}.join(" "))
  end
  
end
