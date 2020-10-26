class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecodeExtensions
  
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_player
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :handling_time

  with_options presence: true do
  validates  :name, 
  validates  :note, 
  validates  :category_id, numericality: { other_than: 1 } 
  validates  :condition_id, numericality: { other_than: 1 } 
  validates  :postage_player_id, numericality: { other_than: 1 } 
  validates  :prefecture_id,  numericality: { other_than: 0 } 
  validates  :handling_time_id, numericality: { other_than: 1 } 
  validates  :price, 
  end

  belongs_to :user
  has_one_attached :image
end
