class ApplicantResponse < ActiveRecord::Base
	has_many :questions
	# has_many :answers, through: :question
	belongs_to :assessment
	has_many :responses
	belongs_to :user
	accepts_nested_attributes_for :responses

	after_save :calculate_score


	def calculate_score
		# Client.where("orders_count = ? AND locked = ?", params[:orders], false)
		user_responses = Response.where("user_id = ? AND assessment_id = ?", self.user_id, self.assessment_id)
		user_answers=[]
		user_responses.each do |response|
			user_answers << response.response_text	
		end
		assessment = Assessment.find_by_id(self.assessment_id)
		questions = assessment.questions
		correct_answers = []
		questions.each do |q|
			correct_answers << q.correct_answer
		end

		puts "user answers #{user_answers}"
		puts "correct_answers #{correct_answers}"
		valid_score = nil
		compare = user_answers.zip(correct_answers).map { |x, y| x == y }
		# if compare.count(true) == compare.count
		# 	valid_score = compare.count(true)
		if compare.count(false) == compare.count
			valid_score = 0
		else
			valid_score = compare.count(true)
			puts "***********************************"
			puts "Score is #{valid_score}"
			puts "***********************************"
		end
		

		#Response.where(:user_id => self.user_id).delete_all

		testscore = TestScore.new
		testscore.user_id = self.user_id
		testscore.assessment_id = self.assessment_id
		testscore.score = valid_score
		testscore.save!
		@test_score = valid_score
		@test_type = Assessment.find_by_id(testscore.assessment_id).test_type
		puts "****test_type= #{@test_type}"
		if @test_type == "Optional"
			sendmail = send_responses_mail(testscore, @test_score)
			puts "HI I am in Optional"
		else
			puts "HI I am in Descriptive"
			sendmail = applicant_response_mail(testscore)
		end
		
		
		user = User.find_by_id(self.user_id)
		user.password = "test1234"
		user.save!
	end
	def applicant_response_mail(testscore)
		puts "testscore is #{testscore.inspect}"
			@assignment_name = Assessment.find_by_id(testscore.assessment_id).name
			@user_name = User.find_by_id(testscore.user_id).name
			@response = Response.where(:user_id=>self.user_id)
			
			#puts "response #{@response} score is #{score}"
			if UserMailer.applicant_response_mail(@assignment_name, @user_name, @response).deliver
				Response.where(:user_id => self.user_id).delete_all
			end
			true
	end

	def send_responses_mail(testscore, score)
			@assignment_name = Assessment.find_by_id(testscore.assessment_id).name
			@user_name = User.find_by_id(testscore.user_id).name
			@response = Response.where(:user_id=>testscore.user_id)
			puts "response #{@response} score is #{score}"
			@score = score
			if UserMailer.send_responses_mail(@assignment_name, @user_name, @response, @score).deliver
				Response.where(:user_id => self.user_id).delete_all
			end
			true
	end

		# def sendmail
		# 	@test_assessment_name = Assessment.find_by_id(self.assessment_id)
		# 	@test_user_name = User.find_by_id(self.user_id)
		# 	@user_name = @test_user_name.name
			
		
			
		# 	UserMailer.applicant_response_mail(@test_assessment_name, @test_user_name, @test_score).deliver_now
		# end
		
		
		
		#send mail with score and mail id of user
		

		# change password of user

		




		

end
