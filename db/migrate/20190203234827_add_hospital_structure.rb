class AddHospitalStructure < ActiveRecord::Migration[5.2]
  def change
  	add_column :hospitals, :hospital_id, :integer
  	add_column :hospitals, :name, :string
  	add_column :hospitals, :city, :string
  	add_column :hospitals, :state, :string
  	add_column :hospitals, :address, :string
  	add_index :hospitals, :hospital_id
  end
end
