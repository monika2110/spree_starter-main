class CreateProductBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_product_badges do |t|
      t.references :spree_product, null: false, foreign_key: true
      t.references :spree_badge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
