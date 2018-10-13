require_relative '../neutrosophy/neutrosophic_set'
require_relative '../neutrosophy/factory'
require 'test/unit'

class NeutrosophicSetElementTest < Test::Unit::TestCase

  def setup
    @svn_number = SVNNumber.new(0.2, 0.3, 0.5)
    @nse = NeutrosophicSetElement.new('test', @svn_number)
  end

  def test_constructor_ok
    assert_equal @nse.label, 'test'
    assert_equal @nse.svn_number, @svn_number
  end

  def test_set_svnnumber_failure
    assert_raise (ArgumentError) {NeutrosophicSetElement.new('test', 'a')}
    assert_raise (ArgumentError) {NeutrosophicSetElement.new('test', 0.1)}
    assert_raise (ArgumentError) {NeutrosophicSetElement.new('test', [0.1, 0.2, 0.5])}
  end

  def test_set_svnnumber_failure2
    assert_raise(ArgumentError) {@nse.svn_number = 'a'}
    assert_raise(ArgumentError) {@nse.svn_number = 0.1}
    assert_raise(ArgumentError) {@nse.svn_number = [0.1, 0.2, 0.5]}
  end

  def test_set_svnnumber_success
    assert_equal @nse.label, 'test'
    assert_equal @nse.svn_number, @svn_number
  end

end

class NeutrosophicSetTest < Test::Unit::TestCase

  def setup
    @nset = NeutrosophicSet.new
    @svn = SVNNumber.new(0.1, 0.2, 0.3)
    @nse = NeutrosophicSetElement.new('test', @svn)
  end

  def test_add_success
    @nset.add(@nse)
    assert_equal @nse, @nset.get('test')
  end

  def test_add_failure
    assert_raise (ArgumentError) {@nset.add('a')}
    assert_raise (ArgumentError) {@nset.add([0.1, 0.2, 0.3])}
    assert_raise (ArgumentError) {@nset.add(0.5)}
  end

  def test_remove_when_found_string
    @nset.add(@nse)
    assert_equal @nset.remove(@nse.label), @nse
  end

  def test_remove_when_found_nse
    @nset.add(@nse)
    assert_equal @nset.remove(@nse), @nse
  end

  def test_remove_when_not_found
    assert_equal @nset.remove(@nse), nil
    assert_equal @nset.remove(@nse.label), nil
  end

  def test_get
    @nset.add(@nse)
    assert_equal @nset.get(@nse.label), @nse
  end

  def test_to_array
    @nset.add(@nse)
    array = @nset.to_array
    assert_true array.instance_of?(Array)
    assert_true array.include? @nse
  end

  def test_to_array_insertion_order
    array = SVNNumberFactory.random_array_of_svn(10)
    set = NeutrosophicSetFactory.set_from_svn_number_array(array)
    set_array = set.to_array
    0.upto(set_array.length - 1) {|i| assert_equal array[i], set_array[i].svn_number}
  end

end