class AddDistrictIdAndUserTypeId < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.belongs_to :district 
      t.string :type
    end
  end
end
