require 'spec_helper'

describe Song do
  let(:song){Song.create(:name => "Thriller")}

  context '.add_genre' do
    let(:genre){Genre.create(:name => "Pop")}

    it "should add the genre" do
      song.add_genre(genre)

      song.genres.should include(genre)
    end

    it 'should return the newly added genre' do
      song.add_genre(genre).should == genre
    end

    it 'should accept an existing genre name' do
      genre = Genre.create(:name => "Techno")
      song.add_genre("Techno").should == genre
    end

    it 'should be able to add a new genre by name' do
      song.add_genre("Pop")
      song.genres.find_by_name("Pop").should be_true
    end

    it "should add only unique genres" do
      song.add_genre(genre)
      song.add_genre(genre)

      song.add_genre("Trance")
      song.add_genre("Trance")

      song.genres.count.should == 2
    end
  end

  context '.artist_name=' do
    it "should assign the artist via the name" do
      song.artist_name = "Michael Jackson"

      song.artist.should be_a(Artist)
      song.artist_name.should == "Michael Jackson"
    end
  end
end
