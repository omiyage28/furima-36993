# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | string | null: false |

### Association

- has_many :products dependent: :destroy
- belongs_to :customer_info: :destroy
- belongs_to :cards : :destroy


## customer_info テーブル

| Column             | Type   | Options                         |
| ------------------ | ------ | ------------------------------- |
| user_id            | string | null: false, foreign_key: true  |
| last_name          | string | null: false                     |
| first_name         | string | null: false                     |
| last_name_kana     | string | null: false                     |
| first_name_kana    | string | null: false                     |
| postal_code        | string | null: false                     |
| prefecture         | string | null: false                     |
| city               | string | null: false                     |
| address            | string | null: false                     |
| apartment          | string | null: false                     |
| phone_number       | string | null: false                     |


### Association

- belongs_to :user

## cards テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | references | null: false, foreign_key: true |
| card_id      | references | null: false                    |

### Association

- belongs_to :user


## products テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| price              | string     | null: false                    |
| description        | string     | null: false                    |
| status             | string     | null: false                    |
| shipping_method    | string     | null: false                    |
| prefecture_id      | string     | null: false                    |
| shipping_date      | string     | null: false                    |
| category_id        | integer    | null: false, foreign_key: true |
| shipping_id        | integer    | null: false, foreign_key: true |
| user_id            | integer    | null: false, foreign_key: true |

### Association


- belongs_to :user dependent: :destroy
- belongs_to :cate dependent: :destroy
- has_many   :images dependent: :destroy
- belongs_to_active_hash :prefecture

## images テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| image              | string     | null: false                    |
| product_id         | integer    | null: false, foreign_key: true |

### Association
- belongs_to :product dependent: :destroy


## category テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| ancestry           | string     |                                |