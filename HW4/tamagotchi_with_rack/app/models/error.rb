module Tamagotchi
  class Error
    attr_reader :display_error, :text_error

    def initialize(params)
      @display_error = params[:display]
      @text_error = params[:text]
    end
  end
end
