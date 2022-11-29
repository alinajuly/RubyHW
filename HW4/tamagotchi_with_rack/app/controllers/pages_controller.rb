require 'erb'
require './app/models/error'
require './app/controllers/base_controller'

module Tamagotchi
  # class for the page to create a pet
  class PagesController < Tamagotchi::BaseController
    def self.create
      return_page(status: 201, view: 'page')
    end
  end
end
