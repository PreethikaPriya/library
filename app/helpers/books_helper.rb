module BooksHelper
	def book_borrowed(current_user,book_id)
		borrowed = current_user.book_users.where('book_id=?',book_id).empty?
	end

	def book_borrowed_status(user_id,book_id)
		status = Status.where('name!=?',"Returned").pluck(:id)
		current_userbooks = BookUser.where('book_id=? and user_id=?', book_id, user_id)
		current_userbook_status = current_userbooks.where(status_id: status)
		current_userbook_status.empty?
	end
end
