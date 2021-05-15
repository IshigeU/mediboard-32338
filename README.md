# README
# アプリケーション名
 ## "mediboard"
 * "mediboard"は薬剤師と患者さんとが気軽につながり、コミュニケーションがはかれるSNSです。くすりのことならなんでも聞ける環境があります。いつも混んでいる病院、薬局。"mediboard"なら、時間を選ばず質問ができます。
 
 
# DEMO
 ## トップページ
 ![c16d1d8ad5a6ded63cf5b38ca25c3f1b](https://user-images.githubusercontent.com/75792991/117117683-cbda1c00-adca-11eb-9d19-a56ee0724b0b.gif)

 ## マイページ
![0e1b7ba6a6dc317954322f20a6d71692](https://user-images.githubusercontent.com/75792991/117117953-1eb3d380-adcb-11eb-9158-e4bea796490b.gif)

 ## ユーザーページ
![f034cb5ce1d2f263c2e40ea3d8c1f497](https://user-images.githubusercontent.com/75792991/117146849-985db880-adef-11eb-947d-a13f8a334b08.gif)


 ## 薬歴管理機能
![3a62280928dabc099117618a10846b61](https://user-images.githubusercontent.com/75792991/117146542-46b52e00-adef-11eb-90c9-9605e5baf3fa.gif)



# Features
## "mediboard"を活用するメリット
* かかりつけの薬剤師がみつかります(くすりの自分専属アドバイザー)
* くすりの疑問が解決できます
* ユーザーが増えればそのぶん情報が蓄積します
* セルフメディケーションの知識が向上します
* 薬剤師の立場が向上、PRになります
* "対面でつながる時代"から"オンラインでつながる時代"へ
* 今後サービスが充実すれば、服薬指導の一括管理が可能です

# 制作背景
## ジェネリック医薬品専門卸にて約7年間営業職に携わるなかで、日本の医療に関する以下の課題を感じました。
* 医薬品の専門家からの情報が少ない
* 医療機関が慢性的に混雑しており、医薬品情報を聞きづらい
* 医療機関が慢性的に混雑しており、診療にかかる時間がとりづらい
* 医薬品の種類やメーカーが多く、どれを選ぶべきなのかがわかりづらい
* かかりつけの医者や薬剤師がいない患者さんが多い
* 薬剤師の知識が患者さんへ広まっていない
* → 薬剤師と患者さんとの間で気軽に意見交換ができ、医療業界をよりよくできる情報が手に入るプラットホームの必要性
* → "mediboard"の制作を考案

# ターゲット層
* アプリケーションの使用に抵抗のない若年層〜中年層の方
* 小さいお子さんをもち、インターネットなどで情報を検索する方
* 医療機関にかかる時間のない、比較的症状の軽い病状の方
* 症状の軽い病状の方で、ドラッグストアなどで医薬品をお探しの方
* 薬剤師として、知識を広めたい、また薬局にお客さんを呼び込みたい方

# Note
* 病状によっては直ちに医療機関を受診しましょう
* レスポンシブ順次対応中です！ 

# URL
* heroku URL
https://mediboard-32338.herokuapp.com/

* Github URL
https://github.com/IshigeU/mediboard-32338.git

* テストユーザー
Email: test@test.com / Pass: ishige1106 / name: Voyaju


# 使用技術
* Rails 6.0.3.5
* Ruby gems 3.0.3


# 機能一覧
## ユーザー登録およびログイン機能(devise)
* アカウント編集機能
* プロフィールの追加機能(Active_hash,Google API,geocoder)
## 質問投稿機能
* コメント機能
* 文字検索機能
## 薬歴管理機能
* スケジュール管理機能(simple_calendar 2.0)
* 健康診断の検査値記録機能
## その他
* プライバシーポリシー(high_voltage)
* RSpec(モデルの単体テスト)
* HTML/CSS(BootStrap)

# テスト(RSpec) 
* userモデル(単体テスト)
* Tweetモデル(単体テスト)
 

# Author
## 製作者: Yusuke Ishige
* Email: theishigedeluxe@gmail.com
* 作成背景: MSという医薬品卸営業の経験から、"mediboard"を考案しました。ブログやTwitterなどで積極的に情報発信している薬剤師の存在を知り、"mediboard"上で、こういった情報が集約されたら、とても便利になると考えます。また、"mediboard"がフル活用できるとセルフメディケーションの推進に役立ちます。
 

# テーブル設計
# **users テーブル**

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

## アソシエーション
* has_many :tweets
* has_many :messages
* has_many :druhis_messages
* has_one  :drug_history
* has_one_attached :image
* belongs_to_active_hash :prefecture
* belongs_to_active_hash :sex
* belongs_to_active_hash :age
* belongs_to_active_hash :job
* has_many :follower, class_name: "Relationship", foreign_key: "follower_id",dependent: :destroy
* has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
* has_many :following_user, through: :follower, source: :followed
* has_many :follower_user, through: :followed, source: :follower


# **relationships テーブル**
* フォロー・フォロワー

| Column            | Type        | Options                                        |
| ----------------- | ----------- | ---------------------------------------------- |
| follower_id       | integer     | null: false, foreign_key: { to_table: :users } |
| followed_id       | integer     | null: false, foreign_key: { to_table: :users } |

## アソシエーション
* belongs_to :follower, class_name: "User"
* belongs_to :followed, class_name: "User"


# **tweets テーブル**
* 投稿

| Column            | Type        | Options                        |
| ----------------- | ----------- | ------------------------------ |
| title             | string      | null: false                    |
| text              | text        | null: false                    |
| user              | references  | null: false, foreign_key: true |

## アソシエーション
* belongs_to :user
* has_many :messages, dependent: :destroy
* has_one_attached :image
* has_many :likes
* has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
* has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
* has_many :following_user, through: :follower, source: :followed
* has_many :follower_user, through: :followed, source: :follower



# **messages テーブル**
* 投稿コメント

| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| text             | text         | null: false                    |
| user             | references   | null: false, foreign_key: true |
| tweet            | references   | null: false, foreign_key: true |

## アソシエーション
* belongs_to :user
* belongs_to :tweet



# **likes テーブル**
* いいね機能

| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| user_id          | integer      | null: false, foreign_key: true |
| tweet_id         | integer      | null: false, foreign_key: true |

## アソシエーション
* belongs_to :user
* belongs_to :tweet


# **drug_history テーブル**
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

## アソシエーション
* belongs_to :user
* has_many :druhis_messages, dependent: :destroy