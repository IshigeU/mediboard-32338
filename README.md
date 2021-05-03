# README
# アプリケーション名
 "mediboard"
 "mediboard"は薬剤師と患者さんとが気軽につながり、コミュニケーションがはかれるSNSです。くすりのことならなんでも聞ける環境があります。
 いつも混んでいる病院、薬局。"mediboard"なら、時間を選ばず質問ができます。
 
 
# DEMO
 * トップページ
 ![6b38fc8e83bb7b133fdfd920d4db365c](https://user-images.githubusercontent.com/75792991/116854897-61db3e80-ac33-11eb-9083-abb2ff795b9f.gif)

 * マイページ
 ![0457a6f95e1848ca7912644027233e56](https://user-images.githubusercontent.com/75792991/116855495-6eac6200-ac34-11eb-9e93-977b23bd6bfd.gif)


# Features
"mediboard"を活用するメリット
* かかりつけの薬剤師がみつかります
* くすりのアドバイザーがみつかります
* くすりの疑問が解決できます
* ユーザーが増えればそれだけ、情報が蓄積します


# Note
病状によっては直ちに医療機関を受診しましょう。
 

# URL
* Github URL
 
* テストユーザー
 * Email: test@test.com
 * Pass: ishige1106
 * name: Voyaju


# 使用技術
* Rails 6.0.3.5
* Ruby gems 3.0.3


# 機能一覧
* ユーザー登録およびログイン機能(devise)
 * アカウント編集機能
  * プロフィールの追加機能(Active_hash,Google API,geocoder)
* 質問投稿機能
 * コメント機能
 * 文字検索機能
* 薬歴管理機能
 * スケジュール管理機能(simple_calendar 2.0)
 * 健康診断の検査値記録機能
* プライバシーポリシー(high_voltage)
* RSpec(モデルの単体テスト)
* HTML/CSS(BootStrap)

# テスト
* RSpec 
 * userモデル(単体テスト)
 * Tweetモデル(単体テスト)


# Note
* 病状によっては直ちに医療機関を受診しましょう。
 

# Author
* 製作者: Yusuke Ishige
* Email: theishigedeluxe@gmail.com
* 作成背景: MSという医薬品卸営業の経験から、"mediboard"を考案しました。ブログやTwitterなどで積極的に情報発信している薬剤師の存在を知り、"mediboard"上で、こういった情報が集約されたら、とても便利になると考えます。また、"mediboard"がフル活用できるとセルフメディケーションの推進に役立ちます。
 

# License
ライセンスを明示する
 
"hoge" is under [MIT license](https://en.wikipedia.org/wiki/MIT_License).
 

# テーブル設計
## **users テーブル**

| Column                | Type     | Options                   |
| --------------------- | -------- | ------------------------- |
| name                  | string   | null: false               |
| email                 | string   | null: false, unique: true |
| encrypted_password    | string   | null: false               |
| prefecture_id         | integer  |                           |
| sex_id                | integer  |                           |
| shop_info             | string   |                           |
| shop_name             | string   |                           |
| age_id                | integer  |                           |
| content               | text     |                           |
| address               | string   |                           |
| job_id                | integer  |                           |
| latitude              | float    |                           |
| longitude             | float    |                           |

# アソシエーション
has_many :tweets
has_many :messages
has_many :druhis_messages
has_one  :drug_history
has_one_attached :image
belongs_to_active_hash :prefecture
belongs_to_active_hash :sex
belongs_to_active_hash :age
belongs_to_active_hash :job
has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy #フォロー取得
has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy #フォロワー取得
has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人


## **relationships テーブル**
* フォロー・フォロワー

| Column            | Type        | Options                                        |
| ----------------- | ----------- | ---------------------------------------------- |
| follower_id       | integer     | null: false, foreign_key: { to_table: :users } |
| followed_id       | integer     | null: false, foreign_key: { to_table: :users } |

# アソシエーション
belongs_to :follower, class_name: "User"
belongs_to :followed, class_name: "User"


## **tweets テーブル**
* 投稿

| Column            | Type        | Options                        |
| ----------------- | ----------- | ------------------------------ |
| title             | string      | null: false                    |
| text              | text        | null: false                    |
| user              | references  | null: false, foreign_key: true |

# アソシエーション
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



## **messages テーブル**
* 投稿コメント

| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| text             | text         | null: false                    |
| user             | references   | null: false, foreign_key: true |
| tweet            | references   | null: false, foreign_key: true |

# アソシエーション
belongs_to :user
belongs_to :tweet



## **likes テーブル**
* いいね機能

| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| user_id          | integer      | null: false, foreign_key: true |
| tweet_id         | integer      | null: false, foreign_key: true |

# アソシエーション
belongs_to :user
belongs_to :tweet


## **drug_history テーブル**
* 薬歴管理(検査値の記録項目)

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
has_many :druhis_messages, dependent: :destroy