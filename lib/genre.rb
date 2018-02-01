require_relative "../config/environment"

class Genre
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    genre = new(name)
    genre.save
    genre
  end

  def save
    self.class.all << self unless self.class.all.include?(self)
  end

  def artists
    songs.map{ |song| song.artist }.uniq
  end
end
