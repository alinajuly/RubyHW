require 'generate_html.rb'

class Pet
  EVENTS = ['jumps', 'lie on the floor', 'licks off', 'rotates'].freeze
  attr_accessor :name, :life, :hunger, :thirst, :joy, :love, :tired, :rest, :smile

  def initialize(name = '', life = 100, hunger = 50, thirst = 50, joy = 50, love = 50, tired = 100, rest = 100)
    @name = name
    @life = life
    @hunger = hunger
    @thirst = thirst
    @joy = joy
    @love = love
    @tired = tired
    @rest = rest
  end

  def greet
    to_show_html("<center><b><font size=7>Hello, I'm #{name} 🤗</font></b></center>")
  end

  def play
    @joy += 20
    passage_of_time
  end

  def feed
    @hunger += 20
    @life += 10
    @love += 10
    @joy += 10
  end

  def drink
    @thirst += 20
    @life += 10
    @love += 10
    @joy += 10
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
    to_show_html("<center><p><b><font size=7>#{EVENTS.sample} 💫</font></b></p></center>")
  end

  def pet_info
    "<center><p><b><font size=7>name:         #{name}</font></b></p></center>
    <center><p><b><font size=7>life:          #{life} ❤️‍🩹</font></b></p></center>
    <center><p><b><font size=7>hunger         #{hunger} 🍔</font></b></p></center>
    <center><p><b><font size=7>thirsty        #{thirst} 💧</font></b></p></center>
    <center><p><b><font size=7>happiness:     #{joy} 🤩</font></b></p></center>
    <center><p><b><font size=7>love:          #{love} 🥰</font></b></p></center>
    <center><p><b><font size=7>tired:         #{tired} 😒</font></b></p></center>
    <center><p><b><font size=7>want to sleep: #{rest} 😴</font></b></p></center>"
  end

  private

  def passage_of_time
    @tired -= rand(0..10)
    @rest -= 20
    @hunger -= rand(0..10)
    @thirst -= rand(0..10)
    @life -= 10 if hungry?
    @life -= 10 if thirsty?
    @life -= 10 if happy?
    @life -= 10 if angry?
    @life -= 10 if wants_to_sleep?
  end

  def hungry?
    hunger < 60 && puts('I want to eat')
  end

  def thirsty?
    thirst < 60 && puts('I want to drink')
  end

  def happy?
    joy < 60 && puts("I want to play") 
  end 

  def angry?
    love < 60 && puts("I want some hug")
  end

  def wants_to_sleep?
    rest < 60 && tired < 60 && puts("I want to sleep")
  end

  def to_show_html(content)
    HtmlGenerator.new.generate_html(content)
  end
end