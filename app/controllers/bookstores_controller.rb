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
      marker.infowindow bookstore.store + bookstore.address + bookstore.description + bookstore.phone_number + bookstore.url
      # marker.infowindow bookstore.store
      end
    if params[:search]
      @bookstores = Bookstore.search_for(params[:search])
    else
      @bookstores = Bookstore.all
    end
  end

  def gmaps4rails_infowindow
    @bookstores = Bookstore.all
    bookstores.store + bookstores.address + bookstores.description + bookstores.phone_number + bookstores.url
  end

  def edit
    @bookstore = Bookstore.find(params[:id])
  end

  def update
    @bookstore = Bookstore.find(params[:id])
    if @bookstore.update(bookstore_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def create
    @bookstore = Bookstore.create(params.require(:bookstore).permit(:address, :store, :description, :phone_number, :url))
    redirect_to root_path
  end
end

private

  def bookstore_params
    params.require(:bookstore).permit(:address, :store, :description, :phone_number, :url)
  end
