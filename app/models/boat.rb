# require './location.rb'

class Boat < ActiveRecord::Base
	belongs_to :user
	has_many :jobs, :dependent => :destroy
	 has_many :userfollowships
  	has_many :followingusers, through: :userfollowships, source: :user
	validates_presence_of :capacity, :location, :name
	validates :name, presence: true, uniqueness: true
end
