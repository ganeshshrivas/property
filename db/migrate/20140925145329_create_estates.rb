class CreateEstates < ActiveRecord::Migration
  def change
    create_table :estates do |t|
      t.string :ptype
      t.string :stype
      t.integer :levels
      t.integer :area
      t.integer :bedroom
      t.integer :hall
      t.integer :bathroom
      t.date :built
      t.string :feature
      t.integer :price
      t.references :user, index: true

      t.timestamps
    end
  end
end
