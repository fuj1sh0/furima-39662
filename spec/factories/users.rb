FactoryBot.define do
  factory :user do
    nickname { 'furima太郎' }
    email { 'taro@test' }
    password { '111aaa' }
    password_confirmation { password }
    last_name { '山田' }
    first_name { '陸太郎' }
    last_name_reading { 'ヤマダ' }
    first_name_reading { 'リクタ' }
    birthday { 'Fri, 29 Nov 1968' }
  end
end
