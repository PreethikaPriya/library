class Book < ApplicationRecord
	belongs_to :category

	has_many :book_users,dependent: :destroy
	has_many :users ,through: :book_users

	validates_presence_of :name ,:author ,:category_id, :availability
	validates_uniqueness_of :name
	validates_numericality_of :availability ,:greater_than_or_equal_to  => 0
end
