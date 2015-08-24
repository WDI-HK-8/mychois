class AddUserTypesToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :user_type, index: true, foreign_key: true
  end
end
