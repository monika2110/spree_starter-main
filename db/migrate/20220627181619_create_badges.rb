class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_badges do |t|
      t.string :name

      t.timestamps
    end
  end
end
