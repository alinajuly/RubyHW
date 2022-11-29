require 'erb'
require './app/models/error'

module Tamagotchi
  class BaseController
    class << self
      def return_error(text)
        @error = Error.new(display: true, text: text )
      end

      def return_page(status:, view:)
        path = "./app/views/#{view}.html.erb"
        template = ERB.new(File.read(path)).result(binding)
        [status, { 'Content-Type' => 'text/html' }, [template]]
      end
    end
  end
end
