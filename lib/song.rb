require 'pry'

class Song

  attr_accessor :name
  attr_reader :artist

  def initialize(name)
    @name = name
    @artist = artist
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def self.new_by_filename(file)
    details = file.split(" - ")
    song_name = details[1]
    artist_name = details[0]

    new_song = Song.new(song_name)
    song_artist = Artist.find_or_create_by_name(artist_name)
    new_song.artist = song_artist
    new_song

  end

end
