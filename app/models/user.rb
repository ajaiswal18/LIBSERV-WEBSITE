class User < ActiveRecord::Base
	
	has_many :assessments
	belongs_to :shortlist
	has_many :responses
	has_many :test_scores
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,  :confirmable,
           :trackable, :validatable, :timeoutable



      
end
