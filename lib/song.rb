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
  	song = Song.new
  	song.save
	song
  end

  def self.new_by_name(name)
  	song = Song.create
  	song.name = name
  	song
  end

  def self.create_by_name(name)
  	song = Song.new
  	song.name = name
  	song.save
  	song
  end

  def self.find_by_name(name)
  	self.all.find{ |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
  	Song.find_by_name(name) || Song.create_by_name(name)
  end

  def self.alphabetical
  	self.all.sort{ |a,b| a.name <=> b.name}
  end

  def self.new_from_filename(file)
  	song_data = file.split(" - ")
  	song_artist = song_data[0]
  	song_name = song_data[1].split(".")[0]

  	song = Song.create_by_name(song_name)
  	song.artist_name = song_artist
  	song
  end

  def self.create_from_filename(file)
  	song_data = file.split(" - ")
  	song_artist = song_data[0]
  	song_name = song_data[1].split(".")[0]

  	song = Song.new
  	song.name = song_name
  	song.artist_name = song_artist

  	song.save

  	song
  end

  def self.destroy_all
  	@@all = []
  end

end
