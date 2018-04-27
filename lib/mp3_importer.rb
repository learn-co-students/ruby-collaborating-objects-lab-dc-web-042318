require 'pry'

class MP3Importer
    
    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        Dir.entries(@path).each_with_object([]) do 
            |file, result| result.push(file) if file.include?("mp3")
        end
    end

    def import
        self.files.each {|file| Song.new_by_filename(file) }
    end

end