class SVNNumber

  attr_reader :t, :i, :f

  def initialize(t, i, f)
    @t = t # true
    @i = i # undeterminated
    @f = f # false
  end

  def check_range(value)
    if value >= 0 and value <= 1
      true
    else
      false
    end
  end

  def component_generic_setter(value)
    if check_range(value)
      value
    else
      throw Exception('t value must be in the range [0,1]')
    end
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