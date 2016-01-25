class Job < ActiveRecord::Base
  belongs_to :boat
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :cargo, length: { minimum: 50 } 
  validates :price, numericality: {minimum: 1000.00 }           
end
