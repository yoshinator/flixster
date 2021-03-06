class Review < ApplicationRecord
  belongs_to :movie

  STARS = [0,1,2,3,4,5]
  validates :name, presence: true 
  validates :comment, length: { minimum: 4 }
  validates :stars, numericality: {greater_than_or_equal_to:0, less_than_or_equal_to: 5}
  validates :stars, inclusion: {in: STARS, message: "Must be between 0 and 10"}

  def stars_as_percent 
    (self.stars / 5.0) * 100.0
  end 

end