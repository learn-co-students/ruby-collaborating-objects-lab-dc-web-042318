require 'pry'

class Artist

  attr_accessor :all, :songs
  attr_reader :name

  @@all = []

  def initialize(name)
    self.save
    @name = name
    @songs = []
  end

  def name=(name)
    @name = name
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name_search)
    existing_artist = @@all.find do |artist|
      artist.name == name_search
    end
    existing_artist ? existing_artist : Artist.new(name_search)
  end

  def print_songs
    @songs.each {|song| puts song.name}
  end

end
