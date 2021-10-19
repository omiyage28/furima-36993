FactoryBot.define do
  factory :item_user_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code {"111-1111"}
    prefecture_id {2}
    city {"名古屋市"}
    address {Faker::Address.street_address}
    apartment {"建物"}
    phone_number {"0#{rand(0..9)}0#{rand(1_000_000..99_999_999)}"} 
  end
end
