class Post < ApplicationRecord
	resourcify
	belongs_to :user
	has_many :steps
end
