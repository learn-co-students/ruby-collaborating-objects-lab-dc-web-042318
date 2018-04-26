require 'pry'
class Artist
    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        self.save
    end

    def save 
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        self.all.find do |artist| artist.name == name end
    end

    def self.find_or_create_by_name(name)
        if self.find_by_name(name)
            self.find_by_name(name)
        else
            artist = Artist.new(name)
        end
    end

    def add_song(song)
        self.songs << song
    end

    def print_songs
        self.songs.each {|song| puts song.name}
    end
end
