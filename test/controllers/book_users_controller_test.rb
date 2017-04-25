require 'test_helper'

# class BookUsersControllerTest < ActionDispatch::IntegrationTest
#   setup do
#     @book_user = book_users(:one)
#   end

#   test "should get index" do
#     get book_users_url
#     assert_response :success
#   end

#   test "should get new" do
#     get new_book_user_url
#     assert_response :success
#   end

#   test "should create book_user" do
#     assert_difference('BookUser.count') do
#       post book_users_url, params: { book_user: { book_id: @book_user.book_id, from: @book_user.from, status: @book_user.status, to: @book_user.to, user_id: @book_user.user_id } }
#     end

#     assert_redirected_to book_user_url(BookUser.last)
#   end

#   test "should show book_user" do
#     get book_user_url(@book_user)
#     assert_response :success
#   end

#   test "should get edit" do
#     get edit_book_user_url(@book_user)
#     assert_response :success
#   end

#   test "should update book_user" do
#     patch book_user_url(@book_user), params: { book_user: { book_id: @book_user.book_id, from: @book_user.from, status: @book_user.status, to: @book_user.to, user_id: @book_user.user_id } }
#     assert_redirected_to book_user_url(@book_user)
#   end

#   test "should destroy book_user" do
#     assert_difference('BookUser.count', -1) do
#       delete book_user_url(@book_user)
#     end

#     assert_redirected_to book_users_url
#   end
# end

class BookUsersControllerTest < ActionController::TestCase
 include Devise::TestHelpers

  test "logged in should get show" do
   sign_in users(:one)
   get :index
   assert_response :success
  end

  # test "not authenticated should get redirect" do
  #  get :index
  #  assert_response :redirect
  # end

  setup do
    sign_in users(:one)
  end

  test "add book_user" do
    post :create, book_user: {book_id: "1" ,user_id: "1", from: "2017-04-20",  to: "2017-04-20", status_id: "1"}
    assert_response :redirect
  end

  test "delete book_user" do
    delete :destroy, id: "1"
    assert_response :redirect
  end

  test "update book_user count" do
    post :update, id: "1", book_user: {book_id: "1" ,user_id: "1", from: "2017-04-20",  to: "2017-05-25", status_id: "1"}
    assert_response :redirect
  end

  test "show book_user" do
    get :show, id: "1"
    assert_response :success
  end
end