class Cat < Pet
  def play 
    super
    to_show_html("<center><b><font size=7>&#128568 #{name} playing with your hand &#128075</font></b></center>" + pet_info)
  end

  def feed
    super
    to_show_html("<center><b><font size=7>&#127835 so tasty mrrmrrrmrrmmmrr &#128568</font></b></center>" + pet_info)
  end

  def drink
    super
    to_show_html("<center><b><font size=7>&#128568 #{name} slurp aloud &#128166</font></b></center>" + pet_info)
  end

  def hug
    super
    to_show_html("<center><b><font size=7>&#128571; &#128573 #{name} loves you too MEOW! &#128147</font></b></center>" + pet_info)
  end

  def walk
    super
    to_show_html("<center><b><font size=7>&#128008 #{name} chasing butterflies &#129419</font></b></center>" + pet_info)
  end

  def put_to_bed
    super
    to_show_html("<center><b><font size=7>&#128164 sleep tight #{name}</font></b></center>" + pet_info)
  end
end