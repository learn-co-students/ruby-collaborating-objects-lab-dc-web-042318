require 'pry'
class MP3Importer
    attr_accessor :path
    attr_reader :files

    def initialize(path)
        @path = path
    end

    def files 
        file_list = Dir["#{self.path}/*"]
        file_list.collect do |file|
            file = file[self.path.length+1..-1]
        end
    end

    def import 
        self.files.each do |file|
            Song.new_by_filename(file)
        end
    end
end