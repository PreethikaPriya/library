class BookUser < ApplicationRecord
	belongs_to :user 
	belongs_to :book
	belongs_to :status

	after_save :update_book_availability_count

	validates_presence_of :book_id ,:user_id ,:from, :to,:status_id

	validate :check_date
	validate :multiple_borrows

	def multiple_borrows
		status_returned_id = Status.where('name=?',"Returned").first.id
		books_borrowed = BookUser.where('user_id=? and book_id=? and status_id !=?', user_id, book_id,status_returned_id)
		if !books_borrowed.empty?
			errors.add(:book_id,"already borrowed and not returned yet!")
		end	
	end
		
	def check_date
		if self.from > self.to 
			errors.add(:to, "date should be greater than from date")
		end

		if self.to < Date.today
			errors.add(:to , "date should be greater than today")
		end 
	end

	def self.create_book_user(id,current_user,book_user)
		book = Book.where('id=?',id).first
		book.with_lock do
			if book.borrowed_count.to_i < book.availability 
				book_user.book_id = book.id
		    book_user.user_id = current_user.id
		    book_user.from = Date.today
		    book_user.to = Date.today + 15.days
		    book_user.status_id = Status.where('name=?',"Borrowed").first.id
		  end  
		end  
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
