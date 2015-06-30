class JobApplicant < ActiveRecord::Base
	mount_uploader :attachment, ResumeUploader
	validates :name, presence: true
	validates :emailid, presence: true
	validates_format_of :emailid, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	
end
