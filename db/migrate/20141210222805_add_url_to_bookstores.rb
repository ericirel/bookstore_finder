class AddUrlToBookstores < ActiveRecord::Migration
  def change
    add_column :bookstores, :url, :string
  end
end
