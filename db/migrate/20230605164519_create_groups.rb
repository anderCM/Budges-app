class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.string :name, null: false, unique: true, limit: 100
      t.string :icon, null: false

      t.timestamps
    end
  end
end
