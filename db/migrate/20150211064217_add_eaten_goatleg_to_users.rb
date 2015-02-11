class AddEatenGoatlegToUsers < ActiveRecord::Migration
  def change
    add_column :users, :eaten_goatleg, :boolean
  end
end
