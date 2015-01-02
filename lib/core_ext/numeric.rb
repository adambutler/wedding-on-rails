class Numeric
  def clamp(min, max)
    self < min ? min : self > max ? max : self
  end
end
