class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.references :users, foreign_key: true
      t.references :bosses, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
