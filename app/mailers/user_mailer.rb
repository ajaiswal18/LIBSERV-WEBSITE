class UserMailer < ApplicationMailer
	
default from: "libserv.helpdesk@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.apply_confirmation.subject
  #
  def apply_confirmation(job_applicant)
    @job_applicant = job_applicant

    mail(to: @job_applicant.emailid, subject: 'Apply Confirmation')

  end
  def job_application(job_applicant)
  	@job_applicant = job_applicant
  	attachments["#{@job_applicant.attachment}"] = File.read("#{Rails.root}/public/#{@job_applicant.attachment}") 
  	mail(to: "anurag.jaiswal@libserv.co", subject: 'Job Application Notification')

  end
   def send_responses_mail(assignment_name, user_name, response, score)
    @assignment_name = assignment_name
    @user_name = user_name
    @response = response
    @score = score
    @questions = []
    
    @response_texts = []
    @response.each do |r|
      @questions << Question.find_by_id(r.question_id)
      @response_texts << r.response_text
      
    end


    # #@response_questions_content = response_questions_content
    # @response_text1 = response_text1
    # @user_name = @response_user_name.name
    #@test_score = test_score
    mail(to: "anurag.jaiswal@libserv.co", subject: "Assessment Response : #{@user_name}")
  end
  def applicant_response_mail(assignment_name, user_name, response)
    @assignment_name = assignment_name
    @user_name = user_name
    @response = response

    puts "response #{@response.inspect}"
    
    @questions = []
    @desc_answer = []
    
    @response.each do |r|
      @questions << Question.find_by_id(r.question_id)
      puts "question is #{@question.inspect}"
      @desc_answer << r.desc_answer
    end

    puts " descriptive answers #{@desc_answer.inspect}"


    # #@response_questions_content = response_questions_content
    # @response_text1 = response_text1
    # @user_name = @response_user_name.name
    #@test_score = test_score
    mail(to: "anurag.jaiswal@libserv.co", subject: "Assessment Response : #{@user_name}")
  end
 
  

   
end
