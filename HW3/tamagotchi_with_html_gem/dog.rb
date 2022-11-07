class Dog < Pet
  def play
    super
    to_show_html("<center><b><font size=7>&#128021 #{name} playing with bone &#129460</font></b></center>" + pet_info)
  end

  def feed
    super
    to_show_html("<center><b><font size=7>&#128054 #{name} loves meat &#129385</font></b></center>" + pet_info)
  end

  def drink
    super
    to_show_html("<center><b><font size=7>&#128054 #{name} slurp aloud &#128166</font></b></center>" + pet_info)
  end

  def hug
    super
    to_show_html("<center><b><font size=7>&#128054 #{name} loves you too WOOF! &#128147</font></b></center>" + pet_info)
  end

  def walk
    super
    to_show_html("<center><b><font size=7>&#128021 #{name} runs up to every tree &#128062; &#127794; &#127795</font></b></center>" + pet_info)
  end

  def put_to_bed
    super
    to_show_html("<center><b><font size=7>&#128164 sleep tight #{name}</font></b></center>" + pet_info)
  end
end