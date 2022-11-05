class Mouse < Pet
  def play 
    super
    to_show_html("<center><b><font size=7>🐁 #{name} playing with tail</font></b></center>"  + pet_info)
  end

  def feed
    super
    to_show_html("<center><b><font size=7>🐭 🧀 so tasty pipipipi</font></b></center>" + pet_info)
  end

  def drink
    super
    to_show_html("<center><b><font size=7>🐭 💦 #{name} slurp aloud</font></b></center>" + pet_info)
  end

  def hug
    super
    to_show_html("<center><b><font size=7>🐭 #{name} loves you too PIPIPI! 💓</font></b></center>" + pet_info)
  end

  def walk
    super
    to_show_html("<center><b><font size=7>🐁 #{name} enjoy the green grass 🍃</font></b></center>" + pet_info)
  end
  
  def put_to_bed
    super
    to_show_html("<center><b><font size=7>💤 sleep tight #{name}</font></b></center>" + pet_info)
  end
end