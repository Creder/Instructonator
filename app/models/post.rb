class Post < ApplicationRecord
	resourcify
	belongs_to :user
	belongs_to :category
    validates :category, presence: true
	has_many :steps
    acts_as_votable
    acts_as_taggable
end
