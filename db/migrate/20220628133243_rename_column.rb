class RenameColumn < ActiveRecord::Migration[6.1]
    def change
      rename_column :spree_product_badges, :spree_product_id, :product_id
      rename_column :spree_product_badges, :spree_badge_id, :badge_id
    end
end
