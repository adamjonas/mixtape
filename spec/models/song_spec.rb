require 'spec_helper'

describe Song do
  let(:song){Song.new(:name => "Thriller")}

  context 'with genres' do
    let(:genre){Genre.create(:name => "Pop")}

    context '.genre_names' do
      it "should return an array of genre names" do
        song.genres << genre
        song.save


        song.genre_names.should be_an_instance_of(Array)
        song.genre_names.should include("Pop")
      end

      it "should accept a genre name and add that genre" do
        song.genre_names = "Techno"
        song.save

        song.genre_names.should include("Techno")
      end

      it "should accept a comma delimited list of genre names" do
        song.genre_names = "Techno, Pop"
        song.save

        song.genre_names.should include("Techno", "Pop")
      end

      it "should accept an array containing comma delimited list of genre names" do
        song.genre_names = ["Techno, Pop", "Rap"]
        song.save

        song.genre_names.should include("Techno", "Pop", "Rap")
      end

      it "should only add unique genres" do
        song.genre_names = ["Pop", "Pop"]
        song.save

        song.genre_names.count.should == 1
      end

    end

    # context '.add_genre' do
    #   it "should add the genre" do
    #     song.add_genre(genre)
    #     song.save

    #     song.genres.should include(genre)
    #   end

    #   it 'should return the newly added genre' do
    #     song.add_genre(genre).should == genre
    #   end

    #   it 'should accept an existing genre name' do
    #     genre = Genre.create(:name => "Techno")
    #     song.add_genre("Techno").should == genre
    #   end

    #   it 'should be able to add a new genre by name' do
    #     song.add_genre("Pop")
    #     song.save

    #     song.genres.find_by_name("Pop").should be_true
    #   end

    # it "should add only unique genres" do
    #   song.add_genre(genre)
    #   song.add_genre(genre)

    #   song.add_genre("Trance")
    #   song.add_genre("Trance")

    #   song.save

    #   song.genres.count.should == 2
    # end
    # end
  end

  context '.artist_name=' do
    it "should assign the artist via the name" do
      song.artist_name = "Michael Jackson"

      song.artist.should be_a(Artist)
      song.artist_name.should == "Michael Jackson"
    end
  end
end
