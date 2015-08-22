class AddDefaultToUsersOffence < ActiveRecord::Migration
  def up
    change_column :users, :offence, :integer, :default => 0
  end
end
