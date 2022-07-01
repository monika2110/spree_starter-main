module Spree
  class Badge < ApplicationRecord
    has_many :product_badges, class_name: 'Spree::ProductBadge', dependent: :destroy
    has_many :badges, class_name: 'Spree::Badge', through: :product_badges
    validates :name, presence: true
  end
end
