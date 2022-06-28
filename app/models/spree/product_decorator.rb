  module Spree
    module ProductDecorator
      def self.prepended(base)
        has_many :product_badges, class_name => 'Spree::ProductBadge',  dependent: :destroy
        has_many :badges, :class_name => 'Spree::Badge', through: :product_badges

      end
    end
  end

::Spree::Product.prepend Spree::ProductDecorator if ::Spree::Product.included_modules.exclude?(Spree::ProductDecorator)
