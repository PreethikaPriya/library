class Status < ApplicationRecord
	validates_presence_of :name
	has_many :book_users,   dependent: :destroy
end
