FactoryBot.define do
  factory :item do
       
    name                 {'名前'}
    description          {'説明'}
    price                {2000}
    status_id            {2}
    shipping_method_id   {2}
    prefecture_id        {2}
    shipping_date_id     {2}
    category_id          {2}
    association :user
  

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end