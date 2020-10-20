
## users table

| Column          | Type   | Options                      | 
| --------------- | ------ | ---------------------------- | 
| nickname        | string | null:false                   | 
| email           | string | null:false, uniqueness: true | 
| password        | string | null:false                   | 
| last_name       | string | null:false                   | 
| first_name      | string | null:false                   | 
| last_name_kana  | string | null:false                   | 
| first_name_kana | string | null:false                   | 
| birth_date      | date   | null:false                   | 


### Association

- has_many :items
- has_many :orders


## items table

| Column            | Type       | Options           | 
| ----------------- | ---------- | ----------------- | 
| name              | string     | null:false        | 
| note              | text       | null:false        | 
| category_id       | integer    | null:false        | 
| condition_id      | integer    | null:false        | 
| postage_player_id | integer    | null:false        | 
| prefecture_id     | integer    | null:false        | 
| handling_time_id  | integer    | null:false        | 
| price             | integer    | null:false        | 
| user              | references | foreign_key: true | 

### Association

- belongs_to :user
- has_one :order

## images table (active_storage)
| image          | string     | null:false        | 


## orders table

| Column | Type       | Options           | 
| ------ | ---------- | ----------------- | 
| item   | references | foreign_key: true | 
| user   | references | foreign_key: true | 

- belongs_to :item
- belongs_to :user
- has_one : address

## addresses table

| Column        | Type       | Options           | 
| ------------- | ---------- | ----------------- | 
| postal_code   | string     | null:false        | 
| prefecture_id | integer    | null:false        | 
| city          | string     | null:false        | 
| street        | string     | null:false        | 
| building      | string     |                   | 
| phone_number  | string     | null:false        | 
| order         | references | foreign_key: true | 

- belongs_to :order
