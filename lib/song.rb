require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    song.save
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end
  
  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)

    #self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end
  
  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end
  
  def self.parse_filename(filename)
    song_data = filename.split(/[-.]/).map(&:strip)
    song_data
  end
  
  def self.new_from_filename(name)
    song_data = parse_filename(name)
    new_song = self.new_by_name(song_data[1])
    new_song.artist_name = song_data[0]
    new_song
  end
  
  def self.create_from_filename(name)
    self.new_from_filename(name).save
    # song_data = parse_filename(name)
    # new_song = self.create_by_name(song_data[1])
    # new_song.artist_name = song_data[0]
    # new_song
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end