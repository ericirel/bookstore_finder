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
      marker.infowindow bookstore.store
      marker.infowindow bookstore.address
      marker.infowindow bookstore.description
      # marker.picture({
      #   "url" => "https://cdn2.iconfinder.com/data/icons/windows-8-metro-style/512/book.png",
      #   "width" => 30,
      #   "height" => 30})
    end
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
    @bookstore = Bookstore.create(params.require(:bookstore).permit(:address, :store, :description))
    redirect_to root_path
  end
end

private

  def bookstore_params
    params.require(:bookstore).permit(:address, :store, :description)
  end
