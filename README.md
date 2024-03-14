# テーブル設計

## users テーブル  

| column                             | type        | options                   |  
|------------------------------------|-------------|---------------------------|  
| nickname                           | string      | null: false               |  
| email                              | string      | null: false, unique: true |  
| encrypted_password                 | string      | null: false               |  
| password_confirmation              | string      | null: false               |  
| last_name                          | string      | null: false               |  
| first_name                         | string      | null: false               |  
| last_name_kana                     | string      | null: false               |  
| first_name_kana                    | string      | null: false               |  
| birthday                           | date        | null: false               |  

## アソシエーション
- has_many : products
- has_many : orders


## products テーブル
| column               | type        | options                       |  
|----------------------|-------------|-------------------------------|  
| user                 | references  | null: false foreign_key: true |  
| name                 | string      | null: false                   |  
| describe             | text        | null: false                   |  
| category             | integer     | null: false                   |  
| status               | integer     | null: false                   |  
| shipping_cost        | integer     | null: false                   |  
| prefectures          | integer     | null: false                   |  
| shipping_days        | integer     | null: false                   |  
| product_price        | integer     | null: false                   |  

## アソシエーション
- belongs_to : usersテーブル
- has_one : ordersテーブル
- belongs_to_active_hash : category
- belongs_to_active_hash : status
- belongs_to_active_hash : shipping_cost
- belongs_to_active_hash : prefectures
- belongs_to_active_hash : shipping_days


## orders テーブル
| column               | type        | options                       |  
|----------------------|-------------|-------------------------------|  
| user                 | references  | null: false foreign_key: true |  
| product              | references  | null: false foreign_key: true |  

## アソシエーション
- belongs_to : users
- belongs_to : orders
- belongs_to : shipping_addresses


## shipping_addresses テーブル
| column               | type        | options                       |  
|----------------------|-------------|-------------------------------|  
| order                | references  | null: false foreign_key: true |  
| postcode             | string      | null: false                   |  
| prefectures          | integer     | null: false                   |  
| municipalities       | string      | null: false                   |  
| street_address       | string      | null: false                   |  
| building_name        | string      |                               |  
| telephone_number     | string      | null: false                   |  

## アソシエーション
- has_one : orders
- belongs_to_active_hash : prefectures