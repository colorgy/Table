class AddSimulatorImageUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :simulator_image_url, :string
  end
end
