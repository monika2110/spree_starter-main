module Spree
  class ProductBadge < ApplicationRecord
    belongs_to :product, class_name: 'Spree::Product'
    belongs_to :badge, class_name: 'Spree::Badge'
    validates :product, uniqueness: { scope: :product }
  end
end
