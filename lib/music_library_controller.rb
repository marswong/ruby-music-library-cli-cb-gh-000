class MusicLibraryController
  def initialize(path)
    MusicImporter.new(path)
  end
end
