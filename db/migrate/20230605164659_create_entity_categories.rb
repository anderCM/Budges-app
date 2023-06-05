class CreateEntityCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :entity_categories do |t|
      t.references :entity, null: false, foreign_key: true, index: true
      t.references :group, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
