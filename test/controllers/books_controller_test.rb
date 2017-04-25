require 'test_helper'

# class BooksControllerTest < ActionDispatch::IntegrationTest
#   setup do
#     @book = books(:one)
#   end

#   test "should get index" do
#     get books_url
#     assert_response :success
#   end

#   test "should get new" do
#     get new_book_url
#     assert_response :success
#   end

#   test "should create book" do
#     assert_difference('Book.count') do
#       post books_url, params: { book: { author: @book.author, availability: @book.availability, category_id: @book.category_id, name: @book.name } }
#     end

#     assert_redirected_to book_url(Book.last)
#   end

#   test "should show book" do
#     get book_url(@book)
#     assert_response :success
#   end

#   test "should get edit" do
#     get edit_book_url(@book)
#     assert_response :success
#   end

#   test "should update book" do
#     patch book_url(@book), params: { book: { author: @book.author, availability: @book.availability, category_id: @book.category_id, name: @book.name } }
#     assert_redirected_to book_url(@book)
#   end

#   test "should destroy book" do
#     assert_difference('Book.count', -1) do
#       delete book_url(@book)
#     end

#     assert_redirected_to books_url
#   end
# end

class BooksControllerTest < ActionController::TestCase
 include Devise::TestHelpers

  test "logged in should get show" do
   sign_in users(:one)
   get :index
   assert_response :success
  end

  test "not authenticated should get redirect" do
    get :index
    assert_response :redirect
   end

  setup do
    sign_in users(:one)
  end

  test "add book" do
    post :create, book: {name: "JungleBook" ,author: "abc", category_id: "1", availability: "5", borrowed_count: "0"}
    assert_response :redirect
  end

  test "delete book" do
    delete :destroy, id: "1"
    assert_response :redirect
  end

  test "update book count" do
    post :update, id: "1", book: {name: "JungleBook" ,author: "abc", category_id: "1", availability: "5", borrowed_count: "0"}
    assert_response :redirect
  end

  test "show book" do
    get :show, id: "1"
    assert_response :success
  end
end