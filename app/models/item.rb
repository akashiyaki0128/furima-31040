class Item < ApplicationRecord


  validates  :name, presence: true
  validates  :note, presence: true
  validates  :category_id, presence: true
  validates  :condition_id, presence: true
  validates  :postage_player_id, presence: true
  validates  :prefecture_id, presence: true
  validates  :handling_time_id, presence: true
  validates  :price, presence: true

  belongs_to :user
  has_one_attached :image
end
