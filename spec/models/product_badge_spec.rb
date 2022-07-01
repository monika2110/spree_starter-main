require 'rails_helper'

RSpec.describe Spree::ProductBadge, type: :model do
  let(:product_badge) { FactoryBot.create(:product_badge) }
  let(:product_badge2) { FactoryBot.create(:product_badge) }


  it 'has a valid factory' do
    expect(product_badge).to be_valid
  end

  it 'is invalid without badge' do
    product_badge.badge = nil
    expect(product_badge).not_to be_valid
  end

  it 'is invalid without product' do
    product_badge.product = nil
    expect(product_badge).not_to be_valid
  end

  it 'is unique' do
    product_badge2.badge = product_badge.badge
    product_badge2.product = product_badge.product

    expect(product_badge2).not_to be_valid
  end


end
