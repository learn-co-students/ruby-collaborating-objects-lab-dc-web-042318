class Artist
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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

  def print_songs
    songs.map { |s| puts s.name }
  end

  def self.find_or_create_by_name(artist)
    names = @@all.map(&:name).collect
    Artist.new(artist) unless names.include?(artist)
  end
end
