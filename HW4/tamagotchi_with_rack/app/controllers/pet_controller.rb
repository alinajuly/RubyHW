require 'erb'
require './app/models/pet'
require './app/models/error'

module Tamagotchi
  class PetController
    # PETS = {
    #   cat: Cat,
    #   rabbit: Dog,
    #   dog: Rabbit
    # }
    class << self
      def pet(request)
        # добавити вибір пета при створені
        # pet_type = request.params['pet_type'] # "dog" => :dog, PETS[:dog] => Dog.new
        # PETS[pet_type.to_sym].new 

        if request.params.key?('name')
          @pet = create_pet(request)
          if check_name_length
            return_page(status: 201, view: 'pet')
          else
            return_error('The name must contain at least 3 characters.')
            return_page(status: 422, view: 'page')
          end
        end
      end

      def check_name_length
        @name.size > 2
      end

      def create_pet(request)
        @name = request['name']
        Pet.new(@name)
      end

      def update(request)
        @pet.update(request.params)
        if @pet.dead?
          return_error('Your pet died...')
          return_page(status: 201, view: 'page')
        else
          return_page(status: 201, view: 'pet') # добавити сторінки для різних петів
        end
      end

      def return_error(text)
        @error = Error.new(display: true, text: text)
      end

      def return_page(status:, view:)
        path = "./app/views/#{view}.html.erb"
        template = ERB.new(File.read(path)).result(binding)
        [status, { 'Content-Type' => 'text/html' }, [template]]
      end
    end
  end
end