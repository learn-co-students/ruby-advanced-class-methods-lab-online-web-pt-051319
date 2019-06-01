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
    self.all.find { |element| name == element.name }
  end
  
  def self.find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create_by_name(name)
  end
  
  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end
  

  def self.new_from_filename(song)
    split_song = song.split(/[-.]/).map(&:strip)
    new_song = new_by_name(split_song[1])
  end

  # def self.format_input(song)
  #   split_song = song.split(/[-.]/).map(&:strip)
  # end
  
  def self.new_from_filename(song)
    split_song = song.split(/[-.]/).map(&:strip)
    new_song = new_by_name(split_song[1])
    new_song.artist_name = split_song[0]
    new_song
  end
  
  def self.create_from_filename(song)
    split_song = song.split(/[-.]/).map(&:strip)
    new_song = create_by_name(split_song[1])
    new_song.artist_name = split_song[0]
    new_song
  end
  
  def self.destroy_all
    self.all.clear
  end

end

