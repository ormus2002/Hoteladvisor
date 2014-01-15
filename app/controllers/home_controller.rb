class HomeController < ApplicationController
  def home
     @hotels = Hotel.all.desc.limit(5)
     @hotels = @hotels.includes(:address)
  end
end
