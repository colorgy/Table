class AddOrganizationCodeToCourseComments < ActiveRecord::Migration
  def change
    add_column :course_comments, :organization_code, :string
  end
end
