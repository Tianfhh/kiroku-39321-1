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
  
| Column   | Type     | Options                          |
| -------- | -------- | -------------------------------- |
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


