class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :affiliation
      t.integer :employee_number
      t.string :uid
      t.datetime :basic_work_time, default: Time.current.change(hour: 7, min: 30, sec: 0)
      t.datetime :work_start_time, :datetime, default: Time.current.change(hour: 9, min: 0, sec: 0)
      t.datetime :work_end_time, :datetime, default: Time.current.change(hour: 18, min: 0, sec: 0)
      t.boolean :superior, default: false
      t.boolean :admin, default: false
      t.string :password_digest
      t.string :remember_digest

      t.timestamps
    end
  end
end
