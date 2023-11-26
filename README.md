# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| name_reading       | string | null: false               |
| birthday           | string | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| title                | text       | null: false                    |
| description          | text       | null: false                    |
| category             | integer    | null: false                    |
| condition            | integer    | null: false                    |
| shipping_fee_paid_by | integer    | null: false                    |
| shipping_from        | integer    | null: false                    |
| days_to_ship         | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone         | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order

# 予約語の例 send, day, value, state, type, transaction 等
# null: false カラムが空の状態では保存できない
# unique: true 一意性のみ許可（同じ値は保存できない）
# foreign_key: true 外部キーを設定（別テーブルのカラムを参照する）