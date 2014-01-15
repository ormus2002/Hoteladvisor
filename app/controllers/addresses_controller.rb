class AddressesController < ApplicationController

  private
    def address_params
      params.require(:address).permit(:country, :state, :city, :street, :hotel_id)
    end
end
