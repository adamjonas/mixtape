class Song < ActiveRecord::Base
  attr_accessible :name, :artist_name, :genre_names
  belongs_to :artist


  has_many :mixtape_songs
  has_many :mixtapes, :through => :mixtape_songs

  has_many :song_genres
  has_many :genres, :through => :song_genres

  def genre_names
    # self.song_genres.collect{|sg| sg.genre.name}
    self.genres.collect{|g| g.name} if self.genres.exists?
  end

  def genre_names=(string)
    sanitize_genre_names_to_a(string).collect do |genre_name|
      add_genre(genre_name.strip)
    end
  end


  def artist_name
    self.artist.name if self.artist
  end

  def artist_name=(string)
    self.artist = Artist.find_or_create_by_name(string)
  end

  private
    def song_genre_exists?(genre)
      self.song_genres.detect{|sg| sg.genre_id == genre.id}
    end

    def sanitize_genre_names_to_a(genre_input)
      [genre_input].flatten.collect{|s| s.split(",")}.flatten
    end

    def add_genre(genre)
      genre = Genre.find_or_create_by_name(genre) if genre.is_a?(String)
      # NOTE: Test to see if we add validation and remove this
      # does it still work
      self.song_genres.build(:genre => genre).genre unless song_genre_exists?(genre)
    end

end
