アプリケーション名
KIROKU


アプリケーション概要
毎日の生活を写真と文章で記録する。
ユーザー同士でフォローしながら、コミュニケーションを行う。


URL
https://kiroku-tzbg.onrender.com

テスト用アカウント
・Basic認証パスワード: 2222
・Basic認証ID: admin
・メールアドレス: hl021501@yahoo.co.jp
・パスワード: a123456


利用方法

①記録投稿
1. ユーザー登録
2. ログイン
3. 写真と文章を投稿
4. フォローしたユーザーの写真と文章を表示

②他者をファロー
1. 投稿一覧ページから写真をクリックして、投稿詳細を確認する
2. 投稿のお気に入り・コメントでメッセージを送る
3. 投稿のユーザーをフォローする


アプリケーションを作成した背景

子供の成長は迅速で変化が多いため、親は記録や管理に手間を感じることがある。成長の履歴を簡単に追跡し、医療チェックや学習計画の立案に役立つ情報を提供する。


洗い出した要件



実装した機能についての画像やGIFおよびその説明



実装予定の機能



開発環境



ローカルでの動作方法



工夫したポイント




データペース設計と画面遷移図

[![Image from Gyazo](https://i.gyazo.com/92b90d33bd8197368f6fbd20ed0d83cc.png)](https://gyazo.com/92b90d33bd8197368f6fbd20ed0d83cc)



## usersテーブル
  
| Column             | Type       | Options                   |
| ------------------ | ---------- | ------------------------- |
| name               | string     | null: false               |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false               |


### Association

- has_many :entries
- has_many :likes
- has_many :comments

- has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
- has_many :followings, through: :active_relationships, source: :follower

- has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
- has_many :followers, through: :passive_relationships, source: :following


## entriesテーブル
  
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| title   | string     | null: false                    |
| text    | text       | null: false                    |
| user    | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many :likes
- has_many :comments


## followersテーブル
  
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| id        | references | null: false, foreign_key: true |
| name      | references | null: false, foreign_key: true |
| email     | references | null: false, foreign_key: true |
| password  | references | null: false, foreign_key: true |


### Association
- belongs_to :follower, class_name: "User"


## followingsテーブル
  
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| id        | references | null: false, foreign_key: true |
| name      | references | null: false, foreign_key: true |
| email     | references | null: false, foreign_key: true |
| password  | references | null: false, foreign_key: true |


### Association
- belongs_to :following, class_name: "User"


## relationshipsテーブル
  
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| id            | references | null: false, foreign_key: true |
| following_id  | references | null: false, foreign_key: true |
| follower_id   | references | null: false, foreign_key: true |


### Association
- has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
- has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id



## likesテーブル
  
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| id       | references | null: false, foreign_key: true |
| like_id  | references | null: false, foreign_key: true |
| user_id  | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :entry




## commentsテーブル
  
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user_id   | references | null: false, foreign_key: true |
| entry_id  | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :entry


