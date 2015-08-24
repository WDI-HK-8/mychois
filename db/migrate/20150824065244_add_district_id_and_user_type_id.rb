class AddDistrictIdAndUserTypeId < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.belongs_to :district 
      t.belongs_to :user_type
    end
  end
end
