class Jobposting < ActiveRecord::Base
	validates :Job_Title, presence: true
	
end
