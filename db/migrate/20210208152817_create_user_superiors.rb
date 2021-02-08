class CreateUserSuperiors < ActiveRecord::Migration[5.1]
  def change
    create_table :user_superiors do |t|
      t.references :user, foreign_key: true
      t.references :superior, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
