class Bookstore < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode

  def self.search_for(query)
    where('store LIKE :query OR address LIKE :query OR description LIKE :query', query: "%#{query}%")
  end
end
