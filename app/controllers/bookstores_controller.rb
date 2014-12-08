class BookstoresController < ApplicationController
  def new
    @bookstore = Bookstore.new
    @bookstores = Bookstore.all
  end

  def index
    @bookstores = Bookstore.all
    @hash = Gmaps4rails.build_markers(@bookstores) do |bookstore, marker|
      marker.lat bookstore.latitude
      marker.lng bookstore.longitude
      marker.infowindow bookstore.description
    end
  end


  def create
    @bookstore = Bookstore.create(params.require(:bookstore).permit(:address, :title, :description))
    redirect_to root_path
  end
end
