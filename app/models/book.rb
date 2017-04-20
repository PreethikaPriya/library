class Book < ApplicationRecord
	belongs_to :category

	has_many :book_users
	has_many :users ,through: :book_users

	validates_presence_of :name ,:author ,:category_id, :availability
end
