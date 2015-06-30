class Question < ActiveRecord::Base
	belongs_to :assessment
	has_many :responses
	has_many :answers, :dependent => :destroy
	has_one :response
	accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
