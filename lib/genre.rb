require_relative "../config/environment"

class Genre
  extend Findable
  
  attr_accessor :name, :songs, :artists
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @artists = []
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
end
