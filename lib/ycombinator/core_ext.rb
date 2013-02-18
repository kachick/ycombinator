class Proc
  
  def y(arg)
    to_ycomb[arg]
  end
  
  def to_ycomb
    YCombinator[self]
  end
  
  def to_ycomb?
    YCombinator.accept? self
  end
  
end