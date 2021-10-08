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


## customer_info テーブル

| Column             | Type   | Options                         |
| ------------------ | ------ | ------------------------------- |
| user_id            | string | null: false, foreign_key: true  |
| postal_code        | string | null: false                     |
| prefecture         | string | null: false                     |
| city               | string | null: false                     |
| address            | string | null: false                     |
| apartment          | string | null: false                     |
| phone_number       | string | null: false                     |


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
| category        | integer    | null: false, foreign_key: true |
| shipping_id        | integer    | null: false, foreign_key: true |
| user_id            | integer    | null: false, foreign_key: true |

### Association

- belongs_to :user dependent: :destroy
- belongs_to_active_hash :prefecture



