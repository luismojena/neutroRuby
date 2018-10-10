require_relative '../neutrosophy/neutrosophic_set'
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

  def test_add

  end

  def test_remove

  end

  def test_get

  end

  def test_to_array

  end

  def test_to_array_insertion_order

  end

end