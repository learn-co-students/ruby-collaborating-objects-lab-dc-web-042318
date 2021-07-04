require 'pry'

class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
    @file_que = []
  end

  def import
    import_que = files
    import_que.each {|file| Song.new_by_filename(file)}
  end

  def files
    files = Dir.entries(path)
    ignored_paths = [".", ".."]
    file_paths = files.map do |file|
      if ignored_paths.include?(file) == false
        file
      end
    end.compact
  end

end
