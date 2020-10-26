class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_player
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :handling_time

  with_options presence: true do
  validates  :image
  validates  :name 
  validates  :note
  validates  :category_id, numericality: { other_than: 1 ,message: "must be selected"} 
  validates  :condition_id, numericality: { other_than: 1 ,message: "must be selected"} 
  validates  :postage_player_id, numericality: { other_than: 1 ,message: "must be selected"} 
  validates  :prefecture_id,  numericality: { other_than: 0 ,message: "must be selected"} 
  validates  :handling_time_id, numericality: { other_than: 1,message: "must be selected" } 
  validates  :price 
  end

  belongs_to :user
  has_one_attached :image
end

# - 価格の範囲が、¥300~¥9,999,999の間であること
# - 販売価格は半角数字のみ保存可能であること
# - 入力された販売価格によって、販売手数料や販売利益の表示が変わること