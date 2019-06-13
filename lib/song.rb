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
    song = Song.create
    Song.all.include?(song) 
  end

  def self.new_by_name
  end

  def self.create_by_name
  end



end
