class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    songs = Dir.entries(path).to_a
    songs.select { |s| s.include?('mp3') }
  end

  def import
    files.each { |file| Song.new_by_filename(file) }
  end
end
