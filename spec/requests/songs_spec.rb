require 'spec_helper'

describe "Songs" do
  describe "GET /songs/new" do
    it "renders the song form" do
      visit new_song_path

      page.should have_selector("form#new_song[action='/songs']")
    end

    it "contains proper fields" do
      visit new_song_path

      page.should have_selector("input#song_name")
      page.should have_selector("input#song_artist_name")
      page.should have_selector("input#song_album_name")
    end

    it "submits and creates the song" do
      visit new_song_path

      fill_in "song_name", :with => "Thriller"
      fill_in "song_artist_name", :with => "Michael Jackson"
      fill_in "song_album_name", :with => "Off the Wall"

      click_button("Song")

      page.should have_content("Thriller")
      page.should have_content("Michael Jackson")
      page.should have_content("Off the Wall")
    end

  end
end
