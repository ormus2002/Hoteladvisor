class CommentsController < ApplicationController

  before_filter :authenticate_user!

  def new
    @hotel = Hotel.find(params[:hotel_id])
    @comment = @hotel.comments.build
  end

  def create
    @hotel = Hotel.find(params[:hotel_id])
    @comment = @hotel.comments.new(comment_params)
    if  Comment.save(@comment)
      redirect_to @hotel
    else
      flash.now[:notice] = @comment.errors.full_messages.join(', ')
      render :new
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:text, :rating)
    end

    def calculate_rating
      (@hotel.comments.sum('rating') / @hotel.comments.count).round(2)
    end
end
