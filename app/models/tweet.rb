class Tweet < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
  has_one_attached :image
  has_many :likes
   # フォロー取得
   has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
   # フォロワー取得
   has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
   # 自分がフォローしている人
   has_many :following_user, through: :follower, source: :followed
   # 自分をフォローしている人
   has_many :follower_user, through: :followed, source: :follower

  validates :title, presence: true
  validates :text, presence: true

  def self.search(search)
    return Tweet.all unless search
    Tweet.where(['text LIKE(?)', "%#{search}%"])
  end
end
