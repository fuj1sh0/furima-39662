class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Input correctly' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phone, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input only number' }
    validates :token
  end

  def save
    order = Order.create(user_id:, item_id:)
    Address.create(postal_code:, prefecture_id:, city:, house_number:,
                   building_name:, phone:, order_id: order.id)
  end
end
