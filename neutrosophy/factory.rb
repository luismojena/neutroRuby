class SVNNumberFactory
  def self.random_svn
    SVNNumber.new(rand, rand, rand)
  end

  def self.random_array_of_svn(number_of_elements)
    raise ArgumentError, 'value must be an integer number' unless number_of_elements.is_a? Integer

    array = []
    0.upto(number_of_elements) {array << self.random_svn}
    array
  end
end

class NeutrosophicSetFactory

  def self.random_set(number_of_elements)
    raise ArgumentError, 'value must be an integer number' unless number_of_elements.is_a? Integer

    nset = NeutrosophicSet.new
    0.upto(number_of_elements) {nset.add SVNNumberFactory.random_svn}
    nset
  end

  def self.set_from_svn_number_array(array)
    raise ArgumentError, 'value must be an array of SVNNumber objects' unless array.is_a? Array

    nset = NeutrosophicSet.new
    array_length = array.length
    0.upto(array_length-1) do |i|
      svn_number = array[i]
      nset_element = NeutrosophicSetElement.new(i.to_s, svn_number)
      nset.add(nset_element)
    end
    nset
  end

  def self.set_from_bidimensional_array(barray)
    # todo: start here next time!!
  end

end