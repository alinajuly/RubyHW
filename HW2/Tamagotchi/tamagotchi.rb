class Pet
  EVENTS = ['jumps', 'lie on the floor', 'licks off', 'rotates'].freeze
  attr_accessor :name, :life, :hunger, :thirst, :joy, :love, :tired, :rest

  def initialize name
    @name = name
    @life = 100
    @hunger = 100
    @thirst = 100
    @joy = 50
    @love = 50
    @tired = 100
    @rest = 100
  end

  def greet
    p "Hello, I'm #{name}"
  end 
  
  def play
    @joy += 20
    passage_of_time
  end

  def feed
    @hunger += 20
    update_stats
  end

  def drink
    @thirst += 20
    update_stats
  end
  
  def hug
    @love += 20
  end

  def walk
    @joy += 10
    passage_of_time
  end

  def put_to_bed
    @rest += 50
    @life += 10
    @tired += 50
    @hunger -= rand(0..10)
    @thirst -= rand(0..10)
    @joy -= 10
    @love -= 10
  end

  def watching
    p EVENTS.sample
  end

  def pet_info
    puts "name: #{name}
    life: #{life}
    hunger #{hunger}
    thirsty #{thirst}
    happiness: #{joy}
    love: #{love}
    tired: #{tired}
    want to sleep: #{rest}"
  end
  
  private

  def update_stats
    @life += 10
    @love += 10
    @joy += 10
  end

  def passage_of_time
    @rest -= 20
    @tired -= rand(0..10)
    @hunger -= rand(0..10)
    @thirst -= rand(0..10)
    @life -= 10 if want_to_eat
    @life -= 10 if want_to_drink
    @life -= 10 if want_to_play
    @life -= 10 if want_to_hug
    @life -= 10 if want_to_sleep
  end

  def want_to_eat
    puts('I want to eat') if hunger < 60
  end

  def want_to_drink
    puts('I want to drink') if thirst < 60
  end

  def want_to_play
    puts("I want to play") if joy < 60
  end 

  def want_to_hug
    puts("I want some hug") if love < 60
  end

  def want_to_sleep
    puts("I want to sleep") if rest < 60 || tired < 60
  end
end

class Dog < Pet
  
  def play
    super
    p "#{name} playing with bone"
  end

  def feed
    super
    p "#{name} gnow bones"
  end

  def drink
    super
    p "slurp aloud"
  end

  def hug
    super
    p "#{name} loves you too WOOF!"
  end

  def walk
    super
    p "#{name} runs up to every tree"
  end

  def put_to_bed
    super
    p "sleep tight #{name}"
  end

  def watch
    super
  end
  
end

class Cat < Pet
  def play 
    super
    p "#{name} playing with your hand"
  end

  def feed
    super
    p "so tasty mrrmrrrmrrmmmrr"
  end

  def drink
    super
    p "slurp aloud"
  end

  def hug
    super
    p "#{name} loves you too MEOW!"
  end

  def walk
    super
    p "#{name} chasing butterflies"
  end

  def put_to_bed
    super
    p "sleep tight #{name}"
  end

  def watch
    super
  end
end

class Mouse < Pet
  def play 
    super
    p "#{name} playing with tail"
  end

  def feed
    super
    p "so tasty pipipipi"
  end

  def drink
    super
    p "slurp aloud"
  end

  def hug
    super
    p "#{name} loves you too PIPIPI!"
  end

  def walk
    super
    p "#{name} enjoy the green grass"
  end
  
  def put_to_bed
    super
    p "sleep tight #{name}"
  end

  def watch
    super
  end
end

p "Please, choose your pet (dog, cat or mouse)"
pet_type = gets.chomp.upcase
pet_array = ['DOG', 'CAT', 'MOUSE']
until pet_array.include?(pet_type) do 
  p 'No such pet, please, choose dog, cat or mouse'
  pet_type = gets.chomp.upcase
end
p "You gave the birth to a new life! What's the name of your pet?"
name = gets.chomp.upcase

pet = Dog.new(name) if pet_type == 'DOG'
pet = Cat.new(name) if pet_type == 'CAT'
pet = Mouse.new(name) if pet_type == 'MOUSE'
pet.greet

def help
  puts "What do you want to do? Press for
    1 to play
    2 to feed
    3 to give a drink
    4 to hug
    5 for a walk
    6 go to bed
    7 just wathing
    8 pet information
    9 end the game"
end

while pet.life != 0
  p "Choose what to do with #{name} (type 'help' if you need it)"
  action = gets.chomp.downcase

  break p "#{name} is DEAD! Rest in peace, little friend..." if pet.life <= 0 || pet.rest <= 0

  case action
  when '1'
    pet.play
  when '2'
    pet.feed
  when '3'
    pet.drink
  when '4'
    pet.hug
  when '5'
    pet.walk
  when '6'
    pet.put_to_bed
  when '7'
    pet.watching
  when '8'
    pet.pet_info
  when '9'
    break
  when 'exit'
    break
  when 'help'
    help
  else
    p 'try again'
  end

end