class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user 
  belongs_to :category
  belongs_to :prefecture
  belongs_to :item_status
  belongs_to :shipping_cost
  belongs_to :shipping_day

  has_one_attached :image


  with_options presence: true do
    validates :user_id
    validates :name
    validates :description
    validates :category_id
    validates :item_status_id
    validates :shipping_cost_id
    validates :shipping_day_id
    validates :prefecture_id
    validates :price
    validates :image
  end
end
