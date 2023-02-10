## テーブル設計

## users テーブル

| Column                 | Type   | Options     |
| ------------------     | ------ | ----------- |
| nickname               | string | null: false |
| email                  | string | null: false ,unique：true|
| encrypted_password     | string | null: false |
| family_name            | string | null: false |
| first_name             | string | null: false |
| family_name_kana       | string | null: false |
| first_name_kana        | string | null: false |
| birth_day              | date   | null: false |

## Association
has_many :items
belongs_to :destination
has_one :order
## items テーブル

| Column          | Type       | Options                       |
| ------          | ------     | -----------------             |
| name            | string     | null: false|
| description     | text       | null: false|
| user            | references | null: false, foreign_key: true |
| price           | string     | null: false| 
| status_id       | string     | null: false                  |
| category_id     | integer     | null: false                |
| shipping_days_id| integer       | null: false|
| shipping_cost_id| integer    | null: false |
| prefecture_id   | integer     | null: false|

## Association
belongs_to :user
has_one :order

## destinations テーブル

| Column         | Type           | Options                        |
| ------         | ----------     | ------------------------------ |
| post_code      | string         | null:false                  |
| prefecture_id  | integer        | null: false                   |
| city           | string         | null: false                   |
| order_id       | references     | null: false, foreign_key: true |
| building_name  | string         |                  |
| phone_number   | string         | null: false                  |
| address        | string         | null: false                  |

## Association
belongs _to :order

## orders テーブル

| Column          | Type       | Options                       |
| ------          | ------     | -----------------             |
| user_id         | references | null: false, foreign_key: true |
| item_id         | references | null: false, foreign_key: true  |

## Association
belongs_to :user
belongs_to :item
has_one :destination
