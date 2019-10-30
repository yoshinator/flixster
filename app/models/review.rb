class Review < ApplicationRecord
  belongs_to :movie

  STARS = [0,1,2,3,4,5,6,7,8,9,10]
  validates :name, presence: true 
  validates :comment, length: { minimum: 4 }
  validates :stars, numericality: {greater_than_or_equal_to:0, less_than_or_equal_to: 10}
  validates :stars, inclusion: {in: STARS, message: "Must be between 0 and 10"}
end