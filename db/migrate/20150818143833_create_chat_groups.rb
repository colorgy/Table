class CreateChatGroups < ActiveRecord::Migration
  def change
    create_table :chat_groups do |t|
      t.string :name
      t.string :organization_code
      t.string :course_code

      t.timestamps null: false
    end
  end
end
