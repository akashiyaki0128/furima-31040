FactoryBot.define do
  factory :user_order do
    user_id { '3' }
    item_id { '5' }

    postal_code { '333-5555' }
    prefecture_id { '2' }
    city { '街' }
    street { '道' }
    building { 'ビル' }
    phone_number { '05012341234' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
