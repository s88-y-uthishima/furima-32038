# テーブル設計

## user テーブル

| Column          | Type   | Options                   |
| --------------- | ------ | ------------------------- |
| nickname        | string | null: false               |
| email           | string | null: false, unique: true |
| password        | string | null: false               |
| last_name       | string | null: false               |
| first_name      | string | null: false               |
| last_name_kana  | string | null: false               |
| first_name_kana | string | null: false               |
| birthday        | date   | null: false               |

### Association

- has_many :items
- has_many :purchases

## item テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| description      | text       | null: false                    |
| category         | string     | null: false                    |
| condition        | string     | null: false                    |
| cost_beaver      | string     | null: false                    |
| shipment_area    | string     | null: false                    |
| preparation_days | string     | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :purchase


## purchase テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :address

## address テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| post_code     | integer | null: false |
| prefecture    | string  | null: false |
| city          | string  | null: false |
| building      | string  |             |
| phone_number  | integer | null: false |

### Association
belongs_to :purchase