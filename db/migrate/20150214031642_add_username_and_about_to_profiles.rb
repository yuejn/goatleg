class AddUsernameAndAboutToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :username, :string
    add_column :profiles, :about, :text
    add_column :profiles, :avatar, :string
  end
end
