FactoryBot.define do
  factory :badge, class: 'Spree::Badge' do
    name { '%' }
  end
end
