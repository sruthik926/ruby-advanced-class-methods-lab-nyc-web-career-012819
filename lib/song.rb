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
    s = self.new
    s.save
    s
  end

  def self.new_by_name(name)
    s = self.new
    s.name = name
    s
  end

  def self.create_by_name(name)
    s = self.new
    s.name = name
    s.save
    s
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by do |obj|
      obj.name
    end
 end

def self.new_from_filename(file_name)
   each_att = file_name.split(" - ")
   artist_name = each_att[0]
   s_name = each_att[1].gsub(".mp3", "")

   song = self.new
   song.name = s_name
   song.artist_name =  artist_name
   song
 end

def self.create_from_filename(file_name)
  each_att = file_name.split(" - ")
  artist_name = each_att[0]
  s_name = each_att[1].gsub(".mp3", "")

  song = self.create
  song.name = s_name
  song.artist_name =  artist_name
  song

end


 def self.destroy_all
    self.all.clear
 end

end
