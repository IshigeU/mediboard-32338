# README
## **users テーブル**

| Column                | Type     | Options                   |
| --------------------- | -------- | ------------------------- |
| name                  | string   | null: false               |
| email                 | string   | null: false, unique: true |
| encrypted_password    | string   | null: false               |
| position_id           | integer  | null: false               |

# アソシエーション
has_many :tweets
has_many :comments
has_many :relationships
has_many :likes
has_one  :shop_info
has_one  :profile
has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy #フォロー取得
has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy #フォロワー取得
has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人


## **relationships テーブル**

| Column            | Type        | Options                                        |
| ----------------- | ----------- | ---------------------------------------------- |
| follower          | references  | null: false, foreign_key: { to_table: :users } |
| followed          | references  | null: false, foreign_key: { to_table: :users } |
| user              | references  | null: false, foreign_key: true                 |

# アソシエーション
belongs_to :follower, class_name: "User"
belongs_to :followed, class_name: "User"


## **tweets テーブル**

| Column            | Type        | Options                        |
| ----------------- | ----------- | ------------------------------ |
| title             | string      | null: false                    |
| text              | text        | null: false                    |
| genre_id          | integer     | null: false                    |
| user              | references  | null: false, foreign_key: true |

# アソシエーション
belongs_to :user
has_many :comments
has_many :likes
has_one_attached



## **comments テーブル**

| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| tweet_comment    | text         | null: false                    |
| user             | references   | null: false, foreign_key: true |
| tweet            | references   | null: false, foreign_key: true |

# アソシエーション
belongs_to :user
belongs_to :tweet



## **likes テーブル**

| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| user             | references   | null: false, foreign_key: true |
| tweet            | references   | null: false, foreign_key: true |

# アソシエーション
belongs_to :user
belongs_to :tweet

## **shop_information テーブル**

| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| name             | string       | null: false                    |
| address          | string       |                                |
| information      | text         |                                |
| shop_comment     | text         |                                |
| user             | references   | null: false, foreign_key: true |

# アソシエーション
belongs_to :user

## **profile テーブル**
| Column           | Type          | Options                        |
| ---------------- | ------------- | ------------------------------ |
| prefecture_id    | integer       |                                |
| sex_id           | integer       |                                |
| shop_info        | text          |                                |
| age_id           | integer       |                                |
| content          | text          |                                |
| user             | references    | null: false, foreign_key: true |

# アソシエーション
belongs_to :user