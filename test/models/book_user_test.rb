require 'test_helper'

class BookUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save bookuser without any attributes" do
 		book_user = BookUser.new
 		assert_not book_user.save ,"Saved bookuser without any attributes" 
 	end

 	test "should not save book without book_id" do
	 	book_user = BookUser.new
	  book_user.user_id = 1
	  book_user.from = Date.today
	  book_user.to  = Date.today + 15.days
	  book_user.status_id = 1
	 assert_not book_user.save ,"Saved bookuser without book_id" 
  end

  test "should not save book without user_id" do
	 	book_user = BookUser.new
	  book_user.book_id = 1
	  book_user.from = Date.today
	  book_user.to  = Date.today + 15.days
	  book_user.status_id = 1
	  assert_not book_user.save ,"Saved bookuser without user_id" 
  end

  test "should not save book without status_id" do
	  book_user = BookUser.new
	  book_user.user_id = 1
	  book_user.from = Date.today
	  book_user.to  = Date.today + 15.days
	  book_user.book_id = 1
	  assert_not book_user.save ,"Saved the book without a status_id"
  end

  test "should not save book without from" do
	  book_user = BookUser.new
	  book_user.user_id = 1
	  book_user.status_id = 1
	  book_user.to  = Date.today 
	  book_user.book_id = 1
	  assert_not book_user.save ,"Saved the book without a from"
  end

  test "should not save book without to" do
	  book_user = BookUser.new
	  book_user.user_id = 1
	  book_user.from = Date.today
	  book_user.status_id  = 1
	  book_user.book_id = 1
	  assert_not book_user.save ,"Saved the book without a to"
  end

   test "should not save book with from date greater than to date" do
	  book_user = BookUser.new
	  book_user.user_id = 1
	  book_user.from = Date.today + 10.days
	  book_user.to = Date.today
	  book_user.status_id  = 1
	  book_user.book_id = 1
	  assert_not book_user.save ,"saved book with from date greater than to date"
  end

  test "should not save book with to date less than today" do
	  book_user = BookUser.new
	  book_user.user_id = 1
	  book_user.from = Date.today 
	  book_user.to = Date.today - 10.days
	  book_user.status_id  = 1
	  book_user.book_id = 1
	  assert_not book_user.save ," saved book with to date less than today"
  end
end
