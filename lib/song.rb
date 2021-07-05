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
    @@all.find {|song| song.name == name}
    
  end
  
  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end
  
  #? def self.new_from_filename(file_name)
  #   song = self.new
  #   title = file_name.split(" - ")
  #   song.artist_name = title[0]
  #   song_name = title[1].split(".")
  #   song.name = "#{song_name[0]}"
  # end
  
  def self.new_from_filename(filename)
    title = filename.split(" - ")
    artist = title[0]
    song_name, extension = title[1].split(".")

    song = self.new 
    song.artist_name = artist 
    song.name = song_name 
    song 
  end
  
  def self.create_from_filename(filename)
    title = filename.split(" - ")
    artist = title[0]
    song_name, extension = title[1].split(".")

    song = self.create 
    song.artist_name = artist 
    song.name = song_name 
    song.save
  end
  
  def self.destroy_all
    @@all.clear
  end
  
end
