class Assessment < ActiveRecord::Base
	has_many :responses
	has_many :applicant_responses
	belongs_to :users
	has_many :questions, :dependent => :destroy
	has_many :test_scores
	accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

end
