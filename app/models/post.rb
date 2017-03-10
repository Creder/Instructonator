class Post < ApplicationRecord
	resourcify
	belongs_to :user
	has_many :steps
	acts_as_votable
	acts_as_taggable

	def score
      self.get_upvotes.size - self.get_downvotes.size
    end
end
