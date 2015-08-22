class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.integer :user_id
      t.integer :user_polled_user_id
      t.string :user_polled_user_gender
      t.integer :user_polled_user_started_year

      t.timestamps null: false
    end
  end
end
