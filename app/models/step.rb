class Step < ApplicationRecord
	belongs_to :post
	belongs_to :user
	has_many :comments
	mount_uploader :stepimage, StepimageUploader

	default_scope { order("priority ASC") }
end
