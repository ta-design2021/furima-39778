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

| Column          | Type   | Options                   |
| --------------- | ------ | ------------------------- |
| nickname        | string | null: false               |
| email           | string | null: false, unique: true |
| password        | string | null: false               |
| last-name       | string | null: false               |
| first-name      | string | null: false               |
| last-name-kana  | string | null: false               |
| first-name-kana | string | null: false               |
| birth-date      | string | null: false               |

### Association

- has_many :items
- has_many :purchased
- has_many :shipping-infomation

## items テーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| item-name                | string     | null: false                    |
| item-info                | text       | null: false                    |
| item-category            | string     | null: false                    |
| item-sales-status        | string     | null: false                    |
| item-shipping-fee-status | string     | null: false                    |
| item-prefecture          | string     | null: false                    |
| item-scheduled-delivery  | string     | null: false                    |
| item-price               | integer    | null: false                    |
| user                     | references | null: false, foreign_key: true |

<!-- ※item-image は ActiveStorage で実装するため含まない -->

### Association

- has_many :users

<!-- # userテーブルとのアソシエーション -->

- belongs_to :user

## purchased テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| number-form | integer    | null: false                    |
| expiry-form | integer    | null: false                    |
| cvc-form    | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

<!-- # userテーブルとのアソシエーション -->

- belongs_to :user
<!-- # itemテーブルとのアソシエーション -->
- belongs_to :item

## shipping infomation テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal-code  | integer    | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| addresses    | string     | null: false                    |
| building     | string     | null: false                    |
| phone-number | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

<!-- # userテーブルとのアソシエーション -->

- belongs_to :user
