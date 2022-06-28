module Spree
  class Badge < ApplicationRecord
  validates :name, presence: true
  end
end
