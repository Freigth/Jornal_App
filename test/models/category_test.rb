require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def test_creating
  @category = Category.new

  assert_equal @category.save, true
  end

end
