module BooksHelper
	def book_borrowed(current_user,book_id)
		borrowed = current_user.book_users.where('book_id=?',book_id).empty?
	end
end
