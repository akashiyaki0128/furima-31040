FactoryBot.define do
  factory :user do
    transient do
      people{Gimei.name}
    end
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 8)
    password {password}
    password_confirmation {password}
    last_name {people.last.kanji}
    first_name {people.first.kanji}
    last_name_kana {people.last.katakana}
    first_name_kana {people.first.katakana}
    birth_date {Faker::Date.birthday}
  end
end
