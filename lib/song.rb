class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(string_name_of_song)
    song = self.new
    song.name = string_name_of_song
    song
  end

  def self.create_by_name(string_name_of_song)
    song = self.new
    song.name = string_name_of_song
    song.save
    song
  end

  def self.find_by_name(string_name_of_song)
    self.all.detect do |song_name|
      song_name.name == string_name_of_song
    end
  end

  def self.find_or_create_by_name(string_name_of_song)
    # song = self.find_by_name(string_name_of_song)
    #   if song == nil
    #     self.create_by_name(string_name_of_song)
    #
    #   else
    #     song
    #   end

    self.find_by_name(string_name_of_song) || self.create_by_name(string_name_of_song)
      #In Ruby, every value is truey unless it is nil or false
      #This is evaluating the first value first, so this method will either find and therefore return a song (a song is a truthy value) OR
      # it will not find a song and return "nil" which is a falsey value. If it finds a song, it will return the song and not execute
      #the second method. If it does not find the song and returns "nil" then it will execute the second half of the OR statement
      # which will create the name of the song.
  end

  def self.alphabetical
    self.all.sort_by{ |song| song.name}
  end

  def self.new_from_filename(mp3_formatted_file)
    c = self.new
    c.name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[1]
    c.artist_name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    c
  end

  def self.create_from_filename(mp3_formatted_file)
    c = self.new
    c.name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[1]
    c.artist_name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    c.save
    c
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end


end
