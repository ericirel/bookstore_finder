class AddPhoneNumberToBookstores < ActiveRecord::Migration
  def change
    add_column :bookstores, :phone_number, :string
  end
end
