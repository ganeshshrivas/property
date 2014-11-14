class AddFieldToEstate < ActiveRecord::Migration
  def change
    add_column :estates, :address, :string
    add_column :estates, :latitude, :float
    add_column :estates, :longitude, :float
  end
end
