class SVNNumber

  attr_reader :t, :i, :f

  def initialize(t, i, f)
    self.t = t
    self.i = i # undeterminated
    self.f = f # false
  end

  def check_range(value)
    if value >= 0 and value <= 1
      true
    else
      false
    end
  end

  def component_generic_setter(value)
    raise Exception, 'value must be in the range [0,1]' unless check_range(value)
    value
  end

  def t=(value)
    @t = component_generic_setter(value)
  end

  def i=(value)
    @i = component_generic_setter(value)
  end

  def f=(value)
    @f = component_generic_setter(value)
  end

end