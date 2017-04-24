require 'test_helper'

class BookTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

   test "can see the welcome page" do
    get "/"
    assert_select "h1", "Book#index"
  end

	test "can create book" do
	get "/books/new"
	assert_response :success

	post "/books",
	params: { book: { title: "can create", body: "book successfully." } }
	assert_response :redirect
	follow_redirect!
	assert_response :success
	assert_select "p", "Title:\n  can create"
	end

end
