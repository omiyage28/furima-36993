class ItemUserAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :apartment, :phone_number, :item_id ,:user_id ,:token


  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :address
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ }
    validates :token
    validates :item_id
    validates :user_id
  end

    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }


    def save
    @information=ItemUser.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, apartment: apartment, phone_number: phone_number, item_user_id: @information.id )
   end
  
end