FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    # last_name             { Faker::Name.last_name }
    # first_name            { Faker::Name.first_name }
    # last_name_kana        { Faker::Name.last_name }
    # first_name_kana       { Faker::Name.first_name }
    last_name             { person.last.kanji }
    first_name            { person.first.kanji }
    last_name_kana        { person.last.katakana }
    first_name_kana       { person.first.katakana }
    birth_date            { Faker::Date.birthday } # ランダムな生年月日を設定
  end
end
