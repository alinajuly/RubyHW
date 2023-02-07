# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  price       :decimal(, )
#  image       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#
class Product < ApplicationRecord
  belongs_to :category
  has_many :line_items, dependent: :destroy
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [200, 200]
    attachable.variant :main, resize_to_limit: [500, 500]
  end

  validates :name, :description, :category_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  after_create_commit -> { broadcast_prepend_to 'products', partial: 'products/products', target: 'products' }
  after_update_commit -> { broadcast_replace_to 'products', partial: 'products/products', target: 'products' }
  after_destroy_commit -> { broadcast_remove_to 'products' }
end
