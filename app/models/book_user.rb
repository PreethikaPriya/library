class BookUser < ApplicationRecord
	belongs_to :user 
	belongs_to :book
	belongs_to :status
	after_save :update_book_availability_count

	#validate :check_currnet_book_status

	def check_currnet_book_status
		status_id = Status.where('name=?',"Returned").first.id
		current_userbook_status = BookUser.where('book_id=? and user_id=? and status_id!=?', book_id, user_id, status_id)
		if !current_userbook_status.empty?
			errors.add(:book_id, "You have already borrowed this book and havent returend yet!")
		end	
	end

	def self.create_book_user(id,current_user,book_user)
		book_user.book_id = Book.where('id=?',id).first.id
	    book_user.user_id = current_user.id
	    book_user.from = Date.today
	    book_user.to = Date.today + 15.days
	    book_user.status_id = Status.all.first.id
	    book_user.save
	end

	def self.set_current_user_records(current_user)
		if current_user.role == "admin"
			@book_users = BookUser.all
		else
			@book_users = current_user.book_users
		end	    
	end

	def update_book_availability_count
		book = Book.where('id=?',book_id).first
		if status_id == Status.where('name=?',"Borrowed").first.id
			book.borrowed_count = book.borrowed_count.to_i + 1
		elsif status_id == Status.where('name=?',"Returned").first.id
			book.borrowed_count  = book.borrowed_count.to_i - 1
		end
		book.save
	end	

end
