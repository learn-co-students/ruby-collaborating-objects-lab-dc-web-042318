class Artist
  attr_accessor :name, :songs

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

  def self.find_or_create_by_name(artist)
    to_add = Artist.new(artist)
    search = @@all.find { |a| a.name == artist }
    if search.nil?
      @@all << to_add
      to_add
    else
      search
    end
  end

  def print_songs
    songs.each { |s| puts s.name }
  end
end
