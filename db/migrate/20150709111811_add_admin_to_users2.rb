class AddAdminToUsers2 < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, :default => true
  end
end
