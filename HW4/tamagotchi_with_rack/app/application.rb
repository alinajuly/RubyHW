require './app/controllers/errors_controller'
require './app/controllers/pages_controller'
require './app/controllers/pet_controller'
require './app/models/pet'

module Tamagotchi
  # class Application redirect to action
  class Application
    def self.call(env)
      request = Rack::Request.new(env)

      return PagesController.create if request.get? && request.path == '/'

      return PetController.pet(request) if request.path == '/pet' && request.post?

      return PetController.update(request) if request.path == '/update' && request.post?

      ErrorsController.not_found
    end
  end
end
