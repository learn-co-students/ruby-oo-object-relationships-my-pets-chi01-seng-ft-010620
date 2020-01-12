require "pry"
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
      @@all.count
    end 

    def self.reset_all
      @@all = []
    end 

    def cats
      Cat.all.select { |cat| cat.owner == self }
    end 

    def dogs
      Dog.all.select { |dog| dog.owner == self }
    end 

    def buy_cat(cat_name)
      Cat.new(cat_name, self)
    end 

    def buy_dog(dog_name)
      Dog.new(dog_name, self)
    end 

    def walk_dogs
      dogs.map do |owners_dogs|
      owners_dogs.mood = "happy"
      end 
    end 

    def feed_cats
      cats.map {|owners_cats| owners_cats.mood = "happy"}
    end 

    def sell_pets
      cats.map {|owners_cats| owners_cats.mood = "nervous" }
      dogs.map {|owners_dogs| owners_dogs.mood = "nervous" }
      cats.map {|owners_cats| owners_cats.owner = nil }
      dogs.map {|owners_dogs| owners_dogs.owner = nil }
    end 

    def list_pets
      my_dogs = dogs.count
      my_cats = cats.count
      p "I have #{my_dogs} dog(s), and #{my_cats} cat(s)."
    end 
end