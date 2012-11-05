class MixtapeSong < ActiveRecord::Base
  attr_accessible :mixtape_id, :song_id

  belongs_to :song
  belongs_to :mixtape
end
