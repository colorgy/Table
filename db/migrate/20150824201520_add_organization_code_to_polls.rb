class AddOrganizationCodeToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :organization_code, :string
  end
end
