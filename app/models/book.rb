class Book < ApplicationRecord
	belongs_to :category

	has_many :book_users,dependent: :destroy
	has_many :users ,through: :book_users

	validates_presence_of :name ,:author ,:category_id, :availability
end
