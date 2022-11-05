class Dog < Pet
  def play
    super
    to_show_html("<center><b><font size=7>🐕 #{name} playing with bone 🦴</font></b></center>")
  end

  def feed
    super
    to_show_html("<center><b><font size=7>🐶 #{name} loves meat 🥩</font></b></center>")
  end

  def drink
    super
    to_show_html("<center><b><font size=7>🐶 💦 #{name} slurp aloud</font></b></center>")
  end

  def hug
    super
    to_show_html("<center><b><font size=7>🐶 #{name} loves you too WOOF! 💓 </font></b></center>")
  end

  def walk
    super
    to_show_html("<center><b><font size=7>🐕 #{name} runs up to every tree 🌳 🌲</font></b></center>")
  end

  def put_to_bed
    super
    to_show_html("<center><b><font size=7>💤 sleep tight #{name}</font></b></center>")
  end
end