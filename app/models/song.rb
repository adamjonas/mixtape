class Song < ActiveRecord::Base
  attr_accessible :name, :artist_name
  belongs_to :artist


  has_many :mixtape_songs
  has_many :mixtapes, :through => :mixtape_songs

  has_many :song_genres
  has_many :genres, :through => :song_genres

  def add_genre(genre)
    genre = Genre.find_or_create_by_name(genre) if genre.is_a?(String)
    self.song_genres.create(:genre => genre).genre unless self.genres.include?(genre)
  end

  def artist_name
    self.artist.name if self.artist
  end

  def artist_name=(string)
    self.artist = Artist.find_or_create_by_name(string)
  end
end
