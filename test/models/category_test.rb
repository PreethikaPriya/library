require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save category without name" do
	  category = Category.new
	  assert_not category.save,"Saved the category without a name"
  end

   test "should not save category with duplicate name" do
  	category1 = Category.new
  	category1.name = "Fiction"
	  category1.save
  	category2 = Category.new
  	category2.name = "Fiction"
	  assert_not category2.save, "Saved category with duplicate name"
  end
end
