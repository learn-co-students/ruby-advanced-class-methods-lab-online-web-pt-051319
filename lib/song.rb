class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def create(name)
    @@all << name.save 
  end 
  
  def self.create 
    s = Song.new
    s.save 
    s 
  end 
  
  def self.new_by_name(name)
    s = Song.new 
    s.name = name 
    s 
  end 
  
  def self.create_by_name(name)
    s = Song.new 
    s.name = name 
    s.save 
    s
  end
  
  def self.find_by_name(name)
    self.all.find{|s| s.name == name}
  end
    
  def self.find_or_create_by_name(song)
    self.find_by_name(song) || self.create_by_name(song)
     
  end  
  
  def self.alphabetical
    self.all.sort_by!{ |m| m.name }
  end 
  
  def self.new_from_filename(string)
    file = string.split(" - ")
    artist_name = file[0]
    name = file[1].gsub(".mp3", "")
    song = Song.new
    song.name = name 
    song.artist_name = artist_name
    song
  end 
  
  def self.create_from_filename(string)
    parts = string.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end
  
  def self.destroy_all()
    self.all.clear
  end 
  
end

  
  
 
  
  
