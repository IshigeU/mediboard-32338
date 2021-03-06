class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #住所から地図を表示させる
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many :tweets
  has_many :messages
  has_many :druhis_messages
  has_many :drug_histories
  has_one_attached :image
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :sex
  belongs_to_active_hash :age
  belongs_to_active_hash :job

  with_options presence: true do
    validates :name
    #passwordは英数字混合
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  end
  
  # フォロー取得
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # フォロワー取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 自分がフォローしている人
  has_many :following_user, through: :follower, source: :followed
  # 自分をフォローしている人
  has_many :follower_user, through: :followed, source: :follower

  # ユーザーをフォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  # フォローをしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end

  has_many :likes
  def liked_by?(tweet_id)
    likes.where(tweet_id: tweet_id).exists?
  end

end
