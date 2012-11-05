class Song < ActiveRecord::Base
  attr_accessible :name
  belongs_to :artist


  has_many :mixtape_songs
  has_many :mixtapes, :through => :mixtape_songs


end
