class Step < ApplicationRecord
  belongs_to :post
  belongs_to :user
  mount_uploader :stepimage, StepimageUploader

  default_scope { order("priority ASC") }
end
