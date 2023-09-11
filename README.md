# アプリケーション名
KIROKU

## アプリケーション概要
アプリケーションは、日常の出来事や思い出を共有し、友達とコミュニケーションを取るためのプラットフォームです。日々の生活をより楽しく、友達や家族とのつながりを強化するのに役立つツールです。思い出を共有し、プライベートな日記を書き、収支を管理して、より豊かな生活を送ることができます。

## URL
[https://kiroku-tzbg.onrender.com](https://kiroku-tzbg.onrender.com)

## テスト用アカウント
- Basic認証パスワード: 2222
- Basic認証ID: admin
- メールアドレス: hl021501@yahoo.co.jp
- パスワード: a123456

## 利用方法
### 記録投稿
1. ユーザー登録
2. ログイン
3. 写真と文章を投稿
4. フォローしたユーザーの写真と文章を表示
5. 日常の収支を記録する
6. プライベートな日記を書く

### 他者をフォロー
1. 投稿一覧ページから写真をクリックして、投稿詳細を確認する
2. 投稿のお気に入り・コメントでメッセージを送る
3. 投稿のユーザーをフォローする

## アプリケーションを作成した背景
このアプリケーションは、ユーザーが日常生活を楽しみ、友達とコミュニケーションを深め、個人の収支を管理できるようにするために開発されました。日記の記録、写真と文章の共有、収支の追跡など、日々の生活をサポートする機能を提供します。

## 洗い出した要件
1. ユーザーアカウント管理
2. 投稿機能
3. フォローシステム
4. 日記機能
5. 収支記録機能
6. コメント機能
7. プライバシー設定
8. セキュリティと認証
9. データベースとバックエンド

## 実装した機能についての画像やGIFおよびその説明
1. ユーザーアカウント管理: ユーザーはアカウントを作成し、プロフィール情報を管理できます。
2. 投稿機能: ユーザーはテキストと写真を含む投稿を作成できます。
3. フォローシステム: ユーザーは他のユーザーをフォローし、フォローしたユーザーの投稿を追跡できます。
4. 日記機能: ユーザーはプライベートな日記を作成・管理できます。
5. 収支記録機能: ユーザーは収入と支出を記録・追跡できます。
6. コメント機能: ユーザーは投稿にコメントを追加できます。
7. プライバシー設定: ユーザーは自身のプライバシー設定を調整し、コンテンツの公開範囲を制御できます。
8. セキュリティと認証: ユーザーアカウントのセキュリティが確保され、認証プロセスが実装されています。
9. データベースとバックエンド: ユーザー情報、投稿、コメント、収支データなどのデータが適切に管理され、バックエンドが機能しています。

## 実装予定の機能
日記機能と収支記録機能の実装予定

## 開発環境

## ローカルでの動作方法

## 工夫したポイント

## データベース設計と画面遷移図
[![Image from Gyazo](https://i.gyazo.com/a1a549f4bbec120675631dafc5cf05c9.png)](https://gyazo.com/a1a549f4bbec120675631dafc5cf05c9)



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
- has_many :diaries
- has_many :records

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
| entry_id | references | null: false, foreign_key: true |
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



## diariesテーブル
  
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| title   | string     | null: false                    |
| text    | text       | null: false                    |
| user_id | references | null: false, foreign_key: true |


### Association

- belongs_to :user



## recordsテーブル
  
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| category | string     | null: false                    |
| amount   | decimal    | null: false                    |
| date     | date       | null: false                    |
| user_id  | references | null: false, foreign_key: true |


### Association

- belongs_to :user