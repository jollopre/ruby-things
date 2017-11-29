require 'minitest/autorun'
require_relative '../../algorithms/flatten'
include Algorithms

describe 'flatten method' do
  it "returns a flatten array given depth 0" do
    assert_equal([1,2,3,4,5], flatten([1,2,3,4,5]))
  end
  it "returns a flatten array given depth 1" do
    assert_equal([1,2,3,4,5], flatten([1,2,3,4,[5]]))
  end
  it "returns a flatten array given depth 2" do
    assert_equal([1,2,3,4,5], flatten([1,2,3,[4,[5]]]))
  end
  it "returns a flatten array given depth 3" do
    assert_equal([1,2,3,4,5], flatten([1,2,[3,[4,[5]]]]))
  end
  it "returns a flatten array given depth 4" do
    assert_equal([1,2,3,4,5], flatten([1,[2,[3,[4,[5]]]]]))
  end
  it "returns a flatten array given depth 5" do
    assert_equal([1,2,3,4,5], flatten([[1,[2,[3,[4,[5]]]]]]))
  end
end