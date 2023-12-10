FactoryBot.define do
  factory :user do
    nickname { 'furima太郎' }
    email { Faker::Internet.email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { '山田' }
    first_name { '陸太郎' }
    last_name_reading { 'ヤマダ' }
    first_name_reading { 'リクタ' }
    birthday { Faker::Date.birthday }
  end
end
