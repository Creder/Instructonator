class Post < ApplicationRecord
	resourcify
	belongs_to :user
	has_many :steps
    acts_as_votable
    acts_as_taggable
    acts_as_taggable_on :tags
end
