require_relative './../svn_number'
require 'test/unit'

class SVNNumberTest < Test::Unit::TestCase
  def test_constructor
    svn = SVNNumber.new(0.1, 0.2, 0.7)
    assert_equal svn.t, 0.1
    assert_equal svn.i, 0.2
    assert_equal svn.f, 0.7
  end

  def test_constraint_over_one
    assert_raise(ArgumentError) {SVNNumber.new(1.1, 0.2, 0.7)}
    assert_raise(ArgumentError) {SVNNumber.new(0.1, 1.2, 0.7)}
    assert_raise(ArgumentError) {SVNNumber.new(0.1, 0.2, 1.7)}
  end

  def test_constraint_below_one
    assert_raise(ArgumentError) {SVNNumber.new(-0.1, -1.2, 0.7)}
    assert_raise(ArgumentError) {SVNNumber.new(0.1, -0.2, 0.7)}
    assert_raise(ArgumentError) {SVNNumber.new(0.1, 0.2, -0.7)}
  end
end