class CreateBookstores < ActiveRecord::Migration
  def change
    create_table :bookstores do |t|
      t.string :address
      t.string :store
      t.text :description
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
