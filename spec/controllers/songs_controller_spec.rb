require 'spec_helper'

describe SongsController do
  describe 'POST /songs' do

    it 'should create a song with a name' do
      post :create, {:song => {:name => "Thriller"}}

      assigns(:song).name.should == "Thriller"
    end

    it 'should create a song with an artist name' do
      post :create, {:song => {:name => "Thriller", :artist_name => "Michael Jackson"}}

      assigns(:song).artist_name.should == "Michael Jackson"
    end

    it "should create a song with a genre string" do
      post :create, {:song => {:name => "Thriller", :genre_names => "Pop"}}

      assigns(:song).genre_names.should include("Pop")
    end


    it "should create a song with a genres from a CSV string" do
      post :create, {:song => {:name => "Thriller", :genre_names => "Pop, Techno"}}

      assigns(:song).genre_names.should include("Pop")
    end

    it "should create a song with a genre array containing CSV string" do
      post :create, {:song => {:name => "Thriller", :genre_names => ["Pop, Techno", "Rap"]}}

      assigns(:song).genre_names.should include("Pop")
    end

    it "should create a song with an album" do
      post :create, {:song => {:name => "Thriller", :album_name => "Off the Wall"}}

      assigns(:song).album_name.should include("Off the Wall")
    end

  end
end
