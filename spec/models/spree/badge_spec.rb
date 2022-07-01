require 'rails_helper'

RSpec.describe Spree::Badge, type: :model do
  let(:badge) { FactoryBot.create(:badge) }

  it 'has a valid factory' do
    expect(badge).to be_valid
  end

  it 'is invalid without name' do
    badge.name = ''
    expect(badge).not_to be_valid
  end
end
