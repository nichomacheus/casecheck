class RemoveHospitalId < ActiveRecord::Migration[5.2]
  def change
  	remove_column :hospitals, :hospital_id
  end
end
