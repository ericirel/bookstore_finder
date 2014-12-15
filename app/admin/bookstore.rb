ActiveAdmin.register Bookstore do

  permit_params :address, :store, :description, :longititude, :latitude, :phone_number, :url

end
