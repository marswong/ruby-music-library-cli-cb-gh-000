class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    @genre = genre
    artist.genres << genre if !artist.genres.include?(genre)
    genre.artists << artist if !genre.artists.include?(artist)
    self.save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    @@all << self.new(name)
  end

  def save
    @@all << self
  end

  def artist=(artist)
    artist.add_song(self)
    @artist = artist
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end
end
