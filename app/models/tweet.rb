class Tweet < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :title, presence: true
  validates :text, presence: true
end
