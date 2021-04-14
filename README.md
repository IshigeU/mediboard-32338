# README
## **users テーブル**

| Column                | Type     | Options                   |
| --------------------- | -------- | ------------------------- |
| name                  | string   | null: false               |
| email                 | string   | null: false, unique: true |
| encrypted_password    | string   | null: false               |

# アソシエーション
has_many :tweets
has_many :comments
has_many :relationships
has_many :likes
has_one  :shop_info
has_one  :profile
has_one  :drug_history
has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy #フォロー取得
has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy #フォロワー取得
has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人


## **relationships テーブル**

| Column            | Type        | Options                                        |
| ----------------- | ----------- | ---------------------------------------------- |
| follower_id       | integer  | null: false, foreign_key: { to_table: :users } |
| followed_id       | integer  | null: false, foreign_key: { to_table: :users } |

# アソシエーション
belongs_to :follower, class_name: "User"
belongs_to :followed, class_name: "User"


## **tweets テーブル**

| Column            | Type        | Options                        |
| ----------------- | ----------- | ------------------------------ |
| title             | string      | null: false                    |
| text              | text        | null: false                    |
| user              | references  | null: false, foreign_key: true |

# アソシエーション
belongs_to :user
has_many :comments
has_many :likes
has_one_attached



## **messages テーブル**

| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| text             | text         | null: false                    |
| user             | references   | null: false, foreign_key: true |
| tweet            | references   | null: false, foreign_key: true |

# アソシエーション
belongs_to :user
belongs_to :tweet



## **likes テーブル**

| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| user_id          | integer      | null: false, foreign_key: true |
| tweet_id         | integer      | null: false, foreign_key: true |

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
| shop_info        | string        |                                |
| shop_name        | string        |                                |
| age_id           | integer       |                                |
| content          | text          |                                |
| user             | references    | null: false, foreign_key: true |

# アソシエーション
belongs_to :user

## **drug_history テーブル**
| Column           | Type          | Options                        |
| ---------------- | ------------- | ------------------------------ |
| hp_name          | string        |                                |
| text             | text          |                                |
| start_time       | datetime      |                                |
| height_id        | integer       |                                |
| weight_id        | integer       |                                |
| pressure_id      | integer       |                                |
| wbc_id           | integer       |                                |
| hb_id            | integer       |                                |
| plt_id           | integer       |                                |
| pt_inr_id        | integer       |                                |
| ast_id           | integer       |                                |
| alt_id           | integer       |                                |
| gdp_id           | integer       |                                |
| scr_id           | integer       |                                |
| egfr_id          | integer       |                                |
| cpk_id           | integer       |                                |
| crp_id           | integer       |                                |
| k_id             | integer       |                                |
| hba1c_id         | integer       |                                |
| user             | references    | null: false, foreign_key: true |

# アソシエーション
belongs_to :user