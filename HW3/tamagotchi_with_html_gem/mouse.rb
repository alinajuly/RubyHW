class Mouse < Pet
  def play 
    super
    to_show_html("<center><b><font size=7>&#128001 #{name} playing with tail</font></b></center>"  + pet_info)
  end

  def feed
    super
    to_show_html("<center><b><font size=7>&#128045 &#129472 so tasty pipipipi</font></b></center>" + pet_info)
  end

  def drink
    super
    to_show_html("<center><b><font size=7>&#128045 #{name} slurp aloud &#128166</font></b></center>" + pet_info)
  end

  def hug
    super
    to_show_html("<center><b><font size=7>&#128045 #{name} loves you too PIPIPI! &#128147</font></b></center>" + pet_info)
  end

  def walk
    super
    to_show_html("<center><b><font size=7>&#128001 #{name} enjoy the green grass &#128062; &#127811</font></b></center>" + pet_info)
  end
  
  def put_to_bed
    super
    to_show_html("<center><b><font size=7>&#128164 sleep tight #{name}</font></b></center>" + pet_info)
  end
end