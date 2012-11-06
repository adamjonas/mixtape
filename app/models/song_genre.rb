class SongGenre < ActiveRecord::Base
  attr_accessible :genre, :song, :song_id, :genre_id

  belongs_to :song
  belongs_to :genre

end
