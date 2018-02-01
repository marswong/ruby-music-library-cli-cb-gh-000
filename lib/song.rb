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

  def self.find_by_name(name)
    @@all.bsearch { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_by_filename(filename)
    arr = filename.split(" - ")
    song = self.new(arr[1])
    artist = Artist.new(arr[0])
    artist.songs << song
    song.artist = artist
    artist.save
    song
  end

  def self.create_from_filename(filename)
    self.new_by_filename(filename)
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
