require 'pry'


class Song

    attr_accessor :name, :artist
    attr_reader :artist_name
    
    def initialize(name)
        @name = name
    end

    def self.new_by_filename(song)
        song_arr = song.split(" - ")
        song = Song.new(song_arr[1])
        artist = Artist.find_or_create_by_name(song_arr[0])
        artist.add_song(song)
        song.artist = artist
        song
    end

    def artist_name=(artist_name)
        @artist_name = artist_name
    end

    
end