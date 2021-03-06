class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user 
  has_one_attached :image
  has_one :item_user
  
  

  belongs_to_active_hash :prefecture
  belongs_to_active_hash :status
  belongs_to_active_hash :category
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :shipping_method



  with_options presence: true do
    
    validates :image
    validates :name
    validates :description
    validates :status_id, numericality: { other_than: 1 , message: "can't be blank" }
    validates :shipping_method_id, numericality:  { other_than: 1 , message: "can't be blank"}
    validates :prefecture_id, numericality:  { other_than: 1 , message: "can't be blank"}
    validates :shipping_date_id, numericality:  { other_than: 1 , message: "can't be blank"}
    validates :category_id, numericality:  { other_than: 1 , message: "can't be blank"}
    validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }
 end


end
