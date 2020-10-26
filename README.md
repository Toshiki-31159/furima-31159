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
- has_many :purchase_information

## itemテーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| image           |        |             |
| name            | string | null: false |
| description     | text   | null: false |
| category        | string | null: false |
| item_status     | string | null: false |
| delivery_charge | string | null: false |
| prefectures     | string | null: false |
| sipping_days    | string | null: false |
| price           | string | null: false |

### Association
- belongs_to :user
- has_one :purchase_information

## Purchase_informationテーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| card_number     | integer | null: false |
| expiration_date | date    | null: false |
| security_code   | integer | null: false |
| postal_code     | string  | null: false |
| phone_number    | integer | null: false |
| prefectures     | string  | null: false |
| municipality    | string  | null: false |
| address         | string  | null: false |
| building_name   | string  | null: false |

### Association
- belongs_to :user
- belongs_to :item