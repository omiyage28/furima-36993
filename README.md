
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
| birthday           | date   | null: false |

### Association
- has_many :product_users
- has_many :products, through: :product_users



## customer_info テーブル

| Column             | Type      | Options                         |
| ------------------ | --------- | ------------------------------- |
| postal_code        | string    | null: false                     |
| prefecture_id      | integer   | null: false                     |
| city               | string    | null: false                     |
| address            | string    | null: false                     |
| apartment          | string    |                                 |
| phone_number       | string    | null: false                     |
| product_user       | references| null: false, foreign_key: true  |

### Association
- belongs_to :product_user



## products テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| price              | integer    | null: false                    |
| description        | text       | null: false                    |
| status_id          | integer    | null: false                    |
| shipping_method_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| shipping_date_id   | integer    | null: false                    |
| category_id        | integer    | null: false,                   |
| shipping_id        | integer    | null: false,                   |
| user               | references | null: false, foreign_key: true |

### Association

- has_one :product_users
- has_many :users, through: :product_users
- belongs_to_active_hash :prefecture



## product_users テーブル

| Column  | Type       | Options                        |
| --------| ---------- | ------------------------------ |
| product | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association
- has_one :customer_info
- belongs_to :product
- belongs_to :user

