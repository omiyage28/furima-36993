FactoryBot.define do
  factory :item do
       
    name                 {'名前'}
    description          {'説明'}
    price                {2000}
    status_id            {1}
    shipping_method_id   {1}
    prefecture_id        {1}
    shipping_date_id     {1}
    category_id          {1}
    id                   {1}
    

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end