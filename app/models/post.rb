class Post < ApplicationRecord
	resourcify
	belongs_to :user
	has_many :steps
	acts_as_votable
	acts_as_taggable
    attr_reader :tag_tokens

    def tag_tokens=(tokens)
  	  self.tag_ids = Tag.ids_from_tokens(tokens)
  	end

	def score
      self.get_upvotes.size - self.get_downvotes.size
    end
end
