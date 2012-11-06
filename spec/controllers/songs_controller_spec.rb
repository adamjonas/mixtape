require 'spec_helper'

describe SongsController do
  describe 'POST /songs' do

    it 'should create a song with a name' do
      post :create, {:song => {:name => "Thriller"}}

      assigns(:song).name.should == "Thriller"
    end

    it 'should create a song with an artist name' do
      post :create, {:song => {:name => "Thriller", :artist_name => "Michael Jackson"}}

      assigns(:song).artist.name.should == "Michael Jackson"
    end

  end
end
