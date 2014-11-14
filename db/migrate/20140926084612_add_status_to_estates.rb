class AddStatusToEstates < ActiveRecord::Migration
  def change
    add_column :estates, :status, :string
  end
end
