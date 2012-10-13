module FormsHelper
  def percent_to_color(percent)
    '#' + ((1 - percent * 0.5) * 127 + 127).to_i.to_s(16) * 3
  end
end
