require_relative 'pet'
require_relative 'dog'
require_relative 'cat'
require_relative 'mouse'
require 'generate_html.rb'

class Game
  
  def choose_pet
    p "Please, choose your pet (dog, cat or mouse)"
    pet_type = gets.chomp.upcase
    pet_array = ['DOG', 'CAT', 'MOUSE']
    until pet_array.include?(pet_type) do 
      p 'No such pet, please, choose dog, cat or mouse'
      pet_type = gets.chomp.upcase
    end
    
    p "You gave the birth to a new life! What's the name of your pet?"
    @name = gets.chomp.upcase

    @pet = Pet.new
    @pet = Dog.new(@name) if pet_type == 'DOG'
    @pet = Cat.new(@name) if pet_type == 'CAT'
    @pet = Mouse.new(@name) if pet_type == 'MOUSE'
    @pet.greet
  end
  
  def new_game
      choose_pet
      help

    while @pet.life != 0
      p "Choose what to do with #{@name} (type 'help' if you need it)"
      action = gets.chomp.downcase

      case action
      when '1'
        @pet.play
      when '2'
        @pet.feed
      when '3'
        @pet.drink
      when '4'
        @pet.hug
      when '5'
        @pet.walk
      when '6'
        @pet.put_to_bed
      when '7'
        @pet.watching
      when '8'
        to_show_html(@pet.pet_info)
      when '9'
        break
      when 'exit'
        break
      when 'help'
        help
      else
        p 'try again'
      end

      if @pet.life <= 0 || @pet.rest <= 0
        to_show_html("<center><b><font size=7>#{@name} is DEAD! Rest in peace, little friend... &#129702</font></b></center>")
        break
      end
    end
  end

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

  private

  def to_show_html(content)
    HtmlGenerator.new.generate_html(content)
  end

end

Game.new.new_game