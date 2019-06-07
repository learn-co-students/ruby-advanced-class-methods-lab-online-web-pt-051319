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
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.find{|x| x.name == name }
  end

  def self.find_or_create_by_name(name)
     self.find_by_name(name) ||
     self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|n| n.name}
  end

  def self.new_from_filename(file)
    song = self.new
    song.name = file.split(" - ",)[1].chomp(".mp3")
    song.artist_name = file.split(" - ")[0]
    song
  end

  def self.create_from_filename(file)
    song = self.new
    song.name = file.split(" - ",)[1].chomp(".mp3")
    song.artist_name = file.split(" - ")[0]
    self.all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
