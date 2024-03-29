require_relative 'svn_number'

#
# NeutrosophicSetElement is a placeholder for the definition in [paper]
#
class NeutrosophicSetElement

  attr_accessor :label
  attr_reader :svn_number

  def initialize(label, svn_number)
    @label = label
    self.svn_number = svn_number
  end

  def svn_number=(svn_number)
    raise ArgumentError, 'value must be an instance of SVNNumber class' unless svn_number.instance_of? SVNNumber
    @svn_number = svn_number
  end

  def to_s
    '(' + label + ',' + '|' + @svn_number.t.to_s + ',' + @svn_number.i.to_s + ',' + @svn_number.f.to_s + '|' + ')'
  end

  def to_str
    self.to_s
  end

end

#
# NeutrosophicSet is the representation of a SVN set
#
class NeutrosophicSet
  def initialize()
    @set = {}
  end

  def add(neutrosophic_set_element)
    raise ArgumentError, 'value must be an instance of NeutrosophicSetElement class' unless neutrosophic_set_element.instance_of? NeutrosophicSetElement
    @set[neutrosophic_set_element.label] = neutrosophic_set_element
  end

  def remove(neutrosophic_set_element)
    if neutrosophic_set_element.instance_of?(String)
      @set.delete(neutrosophic_set_element)
    elsif neutrosophic_set_element.instance_of?(NeutrosophicSetElement)
      @set.delete(neutrosophic_set_element.label)
    else
      raise ArgumentError, 'value must be an instance of [NeutrosophicSetElement,String] class(es)'
    end
  end

  def get(label)
    @set[label]
  end

  def to_array
    @set.values
  end

  def to_s
    str = '['
    self.to_array.each {|item| str += item.to_s}
    str += ']'
  end

  def to_str
    self.to_s
  end

end