require 'pry'

class Artist

  extend Memorable::ClassMethods
  extend Findable::ClassMethods
  include Paramable::InstanceMethods
  include Memorable::InstanceMethods

  attr_accessor :name
  attr_reader :songs

  @@artists = []

  def initialize
    super
    # @@artists << self
    @songs = []
  end

  # def self.find_by_name(name)
  #   #returns an object of the artist by the artist's name
  #   @@artists.detect{|a| a.name == name}
  # end

  def self.all
    #returns an array of all objects
    @@artists
  end

  # def self.reset_all
  #   #clears the array of all objects
  #   self.all.clear
  # end
  #
  # def self.count
  #   #returns a count of the number of artits in the class
  #   self.all.count
  # end

  def add_song(song)
    #associates a song to the artist's collection
    @songs << song
    song.artist = self
  end

  def add_songs(songs)
    #adds an array of songs to the artist
    songs.each { |song| add_song(song) }
  end

  # def to_param
  #   #creates a lowercase, space free, string
  #   name.downcase.gsub(' ', '-')
  # end
end
