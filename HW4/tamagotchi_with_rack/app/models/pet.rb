class Pet
  attr_accessor :name, :hunger, :thirst, :joy, :love, :tired, :image

  def initialize(name = '', hunger = 100, thirst = 100, joy = 50, love = 50, tired = 100, image = 'cat.jpg')
    @name = name
    @hunger = hunger
    @thirst = thirst
    @joy = joy
    @love = love
    @tired = tired
    @image = image
  end

  def update(params = {})
    params.each { |param_key, param_value| self.send("#{param_key}=", param_value) }
  end

  def dead?
    hunger.to_i <= 0 || thirst.to_i <= 0 || joy.to_i <= 0 || love.to_i <= 0 || tired.to_i <= 0
  end
end