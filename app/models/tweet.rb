class Tweet < ApplicationRecord
  belongs_to :user
  has_many :messages
  has_one_attached :image
  has_many :likes

  validates :title, presence: true
  validates :text, presence: true
end
