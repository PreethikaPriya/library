require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
 
 	test "should not save book without any attributes" do
 		book = Book.new
 		assert_not book.save ,"Saved the book without any attributes" 
 	end

  test "should not save book without name" do
	  book = Book.new
	  book.category_id = 1
	  book.author = "test author"
	  book.availability = 10
	  assert_not book.save ,"Saved the book without a name"
  end

  test "should not save book without category" do
	  book = Book.new
	  book.name = "jungle book"
	 	book.author = "test author"
	  book.availability = 10 
	  assert_not book.save ,"Saved the book without a category"
  end

  test "should not save book without availability" do
	  book = Book.new
	  book.name = "jungle book"
	  book.author = "test author"
	  book.category_id = 1
	  assert_not book.save ,"Saved the book without a availability"
  end

  test "should not save book with duplicate name" do
  	book1 = Book.new
  	book1.name = "jungle book"
	  book1.author = "test author"
	  book1.category_id = 1
	  book1.availability = 10
	  book1.save
  	book2 = Book.new
  	book2.name = "jungle book"
	  book2.author = "test author"
	  book2.category_id = 1
	  book2.availability = 10
	  assert_not book2.save, "Saved book with duplicate name"
  end

  test "should not save negative availability for books" do
  	book = Book.new
  	book.name = "jungle book"
	  book.author = "test author"
	  book.category_id = 1
	  book.availability = -1
	  book.save
	  assert_not book.save, "Saved book with negative availability"
  end

end
