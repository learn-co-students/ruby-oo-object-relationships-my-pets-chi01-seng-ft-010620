class Owner
  attr_reader :name, :species
  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self    
  end

  def say_species
    "I am a #{species}."
  end

  def self.all
    @@all
  end

  def self.count
    all.length
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select{|n| n.owner == self}
  end

  def dogs
    Dog.all.select{|n| n.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.map!{|n| n.mood = "happy"}
  end

  def feed_cats
    cats.map!{|n| n.mood = "happy"}
  end

  def sell_pets
    dogs.map!{|dog| dog.mood = "nervous"}
    cats.map!{|cat| cat.mood = "nervous"}
    dogs.map!{|dog| dog.owner = nil}
    cats.map!{|cat| cat.owner = nil}
  end

  def list_pets
    "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end

end