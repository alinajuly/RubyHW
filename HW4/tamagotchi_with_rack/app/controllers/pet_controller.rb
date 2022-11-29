require 'erb'
require './app/models/pet'
require './app/models/error'
require './app/controllers/base_controller'

module Tamagotchi
  class PetController < Tamagotchi::BaseController
    class << self
      def pet(request)
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
        @name = request['name'].upcase
        Pet.new(@name)
      end

      def update(request)
        @pet.update(request.params)
        if @pet.dead?
          return_error('Your pet died...')
          return_page(status: 201, view: 'page')
        else
          return_page(status: 201, view: 'pet')
        end
      end
    end
  end
end
