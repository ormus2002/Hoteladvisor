class ImagesController < ApplicationController

  def index
    @images = Image.where('hotel_id = ?', params[:hotel_id]).desc.to_a
    if @images
      respond_to do |format|
        format.json  { render json: @images.to_json }
      end
    end
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.create(image_params)
  end

  private
  def image_params
    params.require(:image).permit(:image_file, :name, :hotel_id)
  end

end
