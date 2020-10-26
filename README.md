# テーブル設計

## usersテーブル

| Column          | Type   | Options     |
| --------        | -----  | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birth_day       | date   | null: false |

### Association
- has_many :items
- has_many :purchase_records

## itemテーブル

| Column             | Type      | Options           |
| ------------------ | --------- | ----------------- |
| name               | string    | null: false       |
| description        | text      | null: false       |
| category_id        | integer   | null: false       |
| item_status_id     | integer   | null: false       |
| delivery_charge_id | integer   | null: false       |
| prefecture_id      | integer   | null: false       |
| sipping_day_id     | integer   | null: false       |
| price              | integer   | null: false       |
| user               | reference | foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase_record

## Street_addressテーブル

| Column          | Type      | Options           |
| --------------- | --------- | ----------------- |
| postal_code     | string    | null: false       |
| phone_number    | string    | null: false       |
| prefecture_id   | integer   | null: false       |
| municipality    | string    | null: false       |
| address         | string    | null: false       |
| building_name   | string    |                   |
| purchase_record | reference | foreign_key: true |

### Association
- belongs_to : purchase_record

## purchase_recordテーブル

| Column         | Type      | Options           |
| -------------- | --------- | ----------------- |
| user           | reference | foreign_key: true |
| item           | reference | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :street_address