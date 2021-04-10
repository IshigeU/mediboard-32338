class Tweet < ApplicationRecord
  belongs_to :user
  has_many :messages
  has_one_attached :image
  has_many :likes

  validates :title, presence: true
  validates :text, presence: true

  def self.search(search)
    if search
      Tweet.where(['content LIKE ?', "%#{search}%"])
    else
      Tweet.all
    end
  end
end
