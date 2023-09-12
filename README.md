# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...

# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth_date      | string | null: false |

### Association

- has_many :items
- has_many :orders
- has_many :addresses

## items テーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| item_name                | string     | null: false                    |
| item_info                | text       | null: false                    |
| item_category            | string     | null: false                    |
| item_sales_status        | string     | null: false                    |
| item_shipping_fee_status | string     | null: false                    |
| item_prefecture          | string     | null: false                    |
| item_scheduled_delivery  | string     | null: false                    |
| item_price               | integer    | null: false                    |
| user                     | references | null: false, foreign_key: true |

<!-- ※item-image は ActiveStorage で実装するため含まない -->

### Association

<!-- # usersテーブルとのアソシエーション -->

- belongs_to :user

## orders テーブル（購入履歴）

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| card_number | integer    | null: false                    |
| card_expiry | integer    | null: false                    |
| card_cvc    | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

<!-- # usersテーブルとのアソシエーション -->

- belongs_to :user
<!-- # itemsテーブルとのアソシエーション -->

- belongs_to :item

## addresses テーブル（購入者情報）

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| last_name       | string     | null: false                    |
| first_name      | string     | null: false                    |
| last_name_kana  | string     | null: false                    |
| first_name_kana | string     | null: false                    |
| postal_code     | integer    | null: false                    |
| prefecture      | string     | null: false                    |
| city            | string     | null: false                    |
| addresses       | string     | null: false                    |
| building        | string     | null: false                    |
| phone-number    | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

<!-- # usersテーブルとのアソシエーション -->

- belongs_to :user
