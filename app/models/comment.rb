class Comment < ActiveRecord::Base
  scope :desc, -> { order('created_at DESC') }
  belongs_to :hotel
  validates :rating, numericality: { only_integer: true,
                                     greater_than_or_equal_to: 1,
                                     less_than_or_equal_to: 5 }

  validates :text,  presence: true

  after_create :calculate_rating

  def self.save(comment)
    if comment.valid?
      comment.save
      true
    else
      false
    end
  end

  private
    def calculate_rating
      hotel = self.hotel
      hotel.rating = (hotel.comments.sum('rating') / hotel.comments.count).round(2)
      hotel.save
    end 

end
