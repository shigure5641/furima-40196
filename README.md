# テーブル設計

##users テーブル
| column                             | type        | options                   |
| nickname                           | string      | null: false               |
| mail_address                       | string      | null: false               |
| password                           | string      | null: false               |
| password_confirmation              | string      | null: false               |
| last_name                          | string      | null: false               |
| first_name                         | string      | null: false               |
| last_name_kana                     | string      | null: false               |
| first_name_kana                    | string      | null: false               |
| birthday                           | date        | null: false               |

##アソシエーション
-has_many : products
-has_many : orders


##products テーブル
| column               | type        | options                       |
| user_id              | references  | null: false foreign_key: true |
| name                 | string      | null: false                   |
| describe             | text        | null: false                   |
| category             | integer     | null: false                   |
| status               | integer     | null: false                   |
| shipping_cost        | integer     | null: false                   |
| prefectures          | integer     | null: false                   |
| shipping_days        | integer     | null: false                   |
| product_price        | integer     | null: false                   |

##アソシエーション
-belongs_to : usersテーブル
-has_one    : ordersテーブル
-belongs_to_active_hash : category
-belongs_to_active_hash : status
-belongs_to_active_hash : shipping_cost
-belongs_to_active_hash : prefectures
-belongs_to_active_hash : shipping_days


##orders テーブル
| column               | type        | options                       |
| user_id              | references  | null: false foreign_key: true |
| product_id           | references  | null: false foreign_key: true |

##アソシエーション
-belongs_to : usersテーブル
-belongs_to : ordersテーブル
-belongs_to : shipping_addressesテーブル


##shipping_addresses テーブル
| column               | type        | options                       |
| order_id             | references  | null: false foreign_key: true |
| postcode             | integer     | null: false                   |
| prefectures          | integer     | null: false                   |
| municipalities       | string      | null: false                   |
| street_address       | string      | null: false                   |
| Building_name        | string      | null: false                   |
| telephone_number     | integer     | null: false                   |

##アソシエーション
-has_one : ordersテーブル
-belongs_to_active_hash : prefectures