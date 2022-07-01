FactoryBot.define do
  factory :product_badge, class: 'Spree::ProductBadge' do
    product
    badge
  end
end
