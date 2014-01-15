class Hotel < ActiveRecord::Base
  scope :desc, -> { order('rating DESC') }
  validates :title, { presence: true, uniqueness: true }
  validates :rating, presence: true

  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
end
