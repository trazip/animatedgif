class Gif < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  scope :sorted, -> { order(created_at: :desc) }

  acts_as_taggable
end
