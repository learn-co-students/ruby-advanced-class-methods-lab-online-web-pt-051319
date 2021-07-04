require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    #uses the method above instead of direcctly accessing the class variable.
    self.class.all << self
  end
  
  def self.create
    #self.new is the same as saying Song.new
    song = self.new
    @@all << song 
    song
  end 
  
  def self.new_by_name(song_name)
    song = self.new
    #saves the name into the new song instance 
    song.name = song_name
    song
  end
  
  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    @@all << song 
    song
  end
  
  def self.find_by_name(song_name)
    @@all.find {|song| song.name == song_name}
  end
  
  def self.find_or_create_by_name(a_song_name)
    find = self.find_by_name(a_song_name)
    if find
      find 
    else
      song = self.create_by_name(a_song_name)
      song 
   end 
  end
  
  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end 
  
  def self.new_from_filename(filename)
    #concatenated methods first removing .mp3 then spliting in the -
    filename = filename.gsub(".mp3", "").split(" - ")
    song = self.new 
    song.name = filename[1]
    song.artist_name = filename[0]
    song
  end  
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    @@all << song 
  end
  
  def self.destroy_all
    @@all.clear
  end 
end
