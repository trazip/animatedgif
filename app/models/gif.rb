class Gif < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  acts_as_taggable

  scope :sorted, -> { order(created_at: :desc) }
  validate :has_at_least_one_tag
  validate :has_one_image

  def self.random
    order("RANDOM()").first
  end

  def has_one_image
    unless image.attached?
      errors.add(:image, "must have one gif")
    end
  end

  def has_at_least_one_tag
    if tag_list.empty?
      errors.add(:tag_list, "must have at least one tag")
    end
  end
end
