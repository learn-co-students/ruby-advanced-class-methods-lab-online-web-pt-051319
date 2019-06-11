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
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
      self.find_by_name(name) ||
      self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort {|a, b| a.name <=> b.name}
  end

  def self.new_from_filename(filename)
    r1 = /\s[-.]\s/
    r2 = /[.]/
    file_info = filename.split(Regexp.union(r1, r2))
    artist_name = file_info[0]
    song_name = file_info[1]

    song = self.new
    song.artist_name = artist_name
    song.name = song_name
    song
  end

  def self.create_from_filename(filename)
    r1 = /\s[-.]\s/
    r2 = /[.]/
    file_info = filename.split(Regexp.union(r1, r2))
    artist_name = file_info[0]
    song_name = file_info[1]
    song = self.new
    song.artist_name = artist_name
    song.name = song_name
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
