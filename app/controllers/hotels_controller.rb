class HotelsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @hotels = Hotel.all.desc
    @hotels = @hotels.includes(:address)
  end

  def new
    @hotel = Hotel.new
    @hotel.build_address
  end

  def create
    @hotel = Hotel.new hotel_params
    @hotel.valid?
    unless @hotel.errors.any?
      if  @hotel.save
        flash[:success] = 'Hotel was successfully saved'
        redirect_to @hotel
      end
    else
      flash.now[:notice] = @hotel.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
    @hotel = Hotel.where(id: params[:id]).first
    render_404 unless @hotel
  end

  private
    def hotel_params
      params.require(:hotel).permit(:title, :rating, :is_breakfast, :room_description, :room_price,
                                    address_attributes: [:country, :state, :city, :street])
    end
end
