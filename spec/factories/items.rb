FactoryBot.define do
  factory :item do
    association :user
    name { '本' }
    note { 'ジャバスクリプト' }
    category_id { 2 }
    condition_id { 2 }
    postage_player_id { 2 }
    prefecture_id { 1 }
    handling_time_id { 2 }
    price { 3000 }

    after(:build) do |photo|
      photo.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
