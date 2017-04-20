class BookUser < ApplicationRecord
	belongs_to :user 
	belongs_to :book
	belongs_to :status
end
