desc "Create a bunch of seed data for artists and songs"

task :seed_artists_and_songs => [:environment, :clear_artists_and_songs] do
  # Build Song Off Artist
  # Given a Song called R.E.S.P.E.C.T
  # build the Aretha Franklin Artist
  respect = Song.create(:name => "R.E.S.P.E.C.T")
  puts "Just created song #{respect.id} - #{respect.name}"

  respect.build_artist(:name => "Aretha Franklin")
  respect.save
  puts "Just created artist #{respect.artist.id} - #{respect.artist.name}"

  # Build a Song for that Artist
  aretha = Artist.find_by_name "Aretha Franklin"
  aretha.songs.build(:name => "Natural Woman")
  aretha.save
  puts "Just saved a new song #{aretha.songs.last.name} for #{aretha.name}"

  # Manually Create Artist Kanye West
  kanye = Artist.create(:name => "Kanye West")
  # Push a Song Onto an Artist
  # push a song onto Kanye West
  kanye.songs << Song.create(:name => "Two Step")

end

task :clear_artists_and_songs => [:environment] do
  puts "Deleting all Artists and Songs...."

  Artist.delete_all
  Song.delete_all
end
