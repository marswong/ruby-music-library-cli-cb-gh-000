require_relative "../config/environment"

class Artist
  extend Findable
  
  attr_accessor :name, :songs, :genres
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @genres = []
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

  def add_song(song)
    song.artist = self if !song.artist
    @songs << song if !@songs.include?(song)
  end
end
