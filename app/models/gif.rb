class Gif < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  acts_as_taggable
end
