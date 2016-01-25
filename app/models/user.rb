# require './location.rb'

class User < ActiveRecord::Base
	has_many :boats, :dependent => :destroy
	has_many :userfollowships
	has_many :followedships, through: :userfollowships, source: :boat
	has_many :jobs, through: :boats
	validates :email,  presence: true, uniqueness: true
	validates :name, presence: true, uniqueness: true
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	has_secure_password 
	validates_confirmation_of :password
	validates_presence_of :password, on: :create

end
