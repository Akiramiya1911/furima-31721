# テーブル設計

## usersテーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| password           | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_reading  | string  | null: false |
| first_name_reading | string  | null: false |
| birth_year_id      | integer | null: false |
| birth_month_id     | integer | null: false |
| birth_day_id       | integer | null: false |

### Association

- has_many :items

## itemsテーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| item_name           | string  | null: false |
| explanation         | text    | null: false |
| category_id         | integer | null: false |
| condition_id        | integer | null: false |
| shipping_charges_id | integer | null: false |
| shipping_area_id    | integer | null: false |
| days_of_ship_id     | integer | null: false |
| price               | integer | null: false |
| user_id             | integer | null: false |

### Association

- belongs_to :user
- has_one :buyer

## buyersテーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| postal_code         | string  | null: false |
| prefecture_id       | integer | null: false |
| city                | string  | null: false |
| house_number        | string  | null: false |
| building_name       | string  |             |
| telephone_number    | string  | null: false |

### Association

- belongs_to item