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
    return song 
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    return song
  end
  
  def self.create_by_name(title)
    song = self.new
    song.name = title
    @@all << song
    return song
  end 
  
  def self.find_by_name(name)
     @@all.find{|item| item.name == name}
    # @@all.each do |item|
    #   if item.name == name
    #     return item
    #   end
    # end 
    # return false   
  end
  
  def self.find_or_create_by_name(title)
    find_res = self.find_by_name(title)
    find_res ||= self.create_by_name(title)
    return find_res
    
    # if self.find_by_name(title) == nil
    #   self.create_by_name(title)
    # else 
    #   self.find_by_name(title)  
    # end  
  end 
  
  def self.alphabetical
    @@all.sort_by! do |item|
      item.name
    end
    return @@all  
  end
  
  def self.new_from_filename(file)
    song = self.new
    each_file = file.split(" - ")
    minus_mp3 = each_file[1].split(".")
    song.artist_name = each_file[0]
    song.name = minus_mp3[0]
    song
  end
  
  def self.create_from_filename(file)
    @@all << self.new_from_filename(file)
  end
  
  def self.destroy_all
    @@all.clear
  end  

end
