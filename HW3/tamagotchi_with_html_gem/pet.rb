require 'generate_html.rb'

class Pet
  EVENTS = ['jumps', 'lie on the floor', 'licks off', 'rotates'].freeze
  attr_accessor :name, :life, :hunger, :thirst, :joy, :love, :tired, :rest, :smile

  def initialize(name = '', life = 100, hunger = 100, thirst = 100, joy = 50, love = 50, tired = 100, rest = 100)
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
    to_show_html("<center><b><font size=7>Hello, I'm #{name} &#129303</font></b></center>")
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
    to_show_html("<center><p><b><font size=7>#{EVENTS.sample} &#128171</font></b></p></center>")
  end

  def pet_info
    "<center><p><b><font size=7>name:         #{name}</font></b></p></center>
    <center><p><b><font size=7>life:          #{life} &#128148</font></b></p></center>
    <center><p><b><font size=7>hunger         #{hunger} &#127828</font></b></p></center>
    <center><p><b><font size=7>thirsty        #{thirst} &#128167</font></b></p></center>
    <center><p><b><font size=7>happiness:     #{joy} &#129321</font></b></p></center>
    <center><p><b><font size=7>love:          #{love} &#128525</font></b></p></center>
    <center><p><b><font size=7>tired:         #{tired} &#128530</font></b></p></center>
    <center><p><b><font size=7>want to sleep: #{rest} &#128564</font></b></p></center>"
  end

  private

  def update_stats
    @life += 10
    @love += 10
    @joy += 10
  end

  def passage_of_time
    @tired -= rand(0..10)
    @rest -= 10
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

  def to_show_html(content)
    HtmlGenerator.new.generate_html(content)
  end
end