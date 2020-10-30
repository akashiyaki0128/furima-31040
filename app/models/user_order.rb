class UserOrder

  include ActiveModel::Model
  
  attr_accessor :token,:postal_code, :prefecture_id, :city, :street, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id,numericality: { other_than: 0, message: "must be selected" }
    validates :city 
    validates :street
    validates :phone_number, format: {with: /\A[0-9]{1,11}\z/, message: "is invalid. Input only number"}
    validates :token
  end
  
  
  def saved
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street: street, building: building, phone_number: phone_number, order_id: order.id)
  end
  
end