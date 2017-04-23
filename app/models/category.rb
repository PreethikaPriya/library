class Category < ApplicationRecord
	has_many :books ,  dependent: :destroy
	validates_presence_of :name
	validates_uniqueness_of :name
end
