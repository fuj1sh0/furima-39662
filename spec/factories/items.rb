FactoryBot.define do
  factory :item do
    title                       { 'iPhone' }
    description                 { '3年前に購入したiPhoneです' }
    category_id                 { 1 }
    condition_id                { 1 }
    shipping_fee_paid_by_id     { 1 }
    prefecture_id               { 1 }
    days_to_ship_id             { 1 }
    price                       { 30_000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
