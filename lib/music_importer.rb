# class MusicImporter
#   attr_accessor :path, :files
# 
#   def initialize(path)
#     if Dir.exist?(path)
#       @path = path
#       @files = Dir.entries(path).select { |filename| filename.end_with?(".mp3") }
#     end
#   end
# 
#   def import
#     @files.each { |filename| Song.create_from_filename(filename) }
#   end
# end


class MusicImporter
  
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    Dir.glob("#{path}/*.mp3").collect{ |x| x.gsub("#{path}/", "") }
  end
  
  def import 
    files.each{ |file| Song.create_from_filename(file) }
  end
  
end