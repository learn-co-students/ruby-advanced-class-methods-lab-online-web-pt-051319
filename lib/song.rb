require 'pry'

class Song
  
  attr_accessor :name, :artist_name
  
  @@all = []

  def self.create
    song = Song.new
    @@all << song
    return song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
      song
  end 
  
  def self.create_by_name(name)
   song = self.new 
   song.name = name 
    @@all << song
    # is there a way not to repeat this? I tried using #new_by_name but it wasn't working right
    song
  end 
  
  def self.find_by_name(name)
    @@all.find {|p| p.name == name}
  end 
  
  def self.find_or_create_by_name(name)
      self.create_by_name(name)
      self.find_by_name(name)
      #why does this work? why doesn't it have to check if the song is already there?
  end 
  
  def self.alphabetical
    @@all.sort_by {|song| song.name }
  end 
  
  def self.new_from_filename(file_name)
     song = self.new
     parts = file_name.split("-")
     song.artist_name = parts[0][0...-1]
     title = parts[1]
     song.name = title[1...-4]
     song
  end 

  def self.create_from_filename(file_name)
     song = self.new
     parts = file_name.split("-")
     song.artist_name = parts[0][0...-1]
     title = parts[1]
     song.name = title[1...-4]
     @@all << song 
  end 
  
  def self.destroy_all
    @@all = []
  end 

  def song 
    @song 
  end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
end
