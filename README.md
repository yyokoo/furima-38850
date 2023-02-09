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
## items テーブル

| Column          | Type       | Options                       |
| ------          | ------     | -----------------             |
| name            | string     | null: false|
| description     | text       | null: false|
| image           | string     | null: false,                  |
| shipping_cost   | string     | null: false |
| shipping_days   | text       | null: false|
| category        | string     | null: false,                  |
| user            | references | null: false, foreign_key: true |
| status          | string     | null: false,                  |

## Association
belongs_to :user
has_one :destination
## destination テーブル

| Column         | Type           | Options                        |
| ------         | ----------     | ------------------------------ |
| post_code      | string         |null:false,                   |
| prefecture     | string         | null: false,                   |
| city           | string         | null: false,                   |
| user           | references     | null: false, foreign_key: true |
| building_name  | string         | null: false,                  |
| phone_number   | string         | null: false,                  |
| address        | string         | null: false,                  |

## Association
belongs_to :user
has_many :items