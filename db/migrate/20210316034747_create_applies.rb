class CreateApplies < ActiveRecord::Migration[5.1]
  def change
    create_table :applies do |t|
      t.references :member, foreign_key: { to_table: :users }
      t.references :superior, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
