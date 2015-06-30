class ApplicantResponsesController < ApplicationController
  
  before_filter :authenticate_user!
  #before_filter :calc_score
  #after_filter :score

  def scores
    
  end

  def index
  	#@applicant_responses = ApplicantResponse.all



  end
  def show
  end
  

  def new

    


    @user = User.where(:user_id=>'current_user_signed_in')
    
    
    
  	@applicant_response = ApplicantResponse.new
    
    #@assessment = Assessment.where(:assessment_id=>'current_user.shortlist_id')
    #puts "#{@assessment.inspect}*******************"
    @test = Assessment.all
    @shortlist = Shortlist.where(:id=>current_user.shortlist_id).first
    puts "shortlist id #{@shortlist.id}"
    @assessment_id = @shortlist.assessment_id
    puts "asss #{@assessment_id}"
  	@assessment = Assessment.where(:id=>@assessment_id).first
  	@questions = Question.where(:assessment_id=>@assessment.id)
    
    #@questions = Question.all
  	@answers = Question.first.id
  	@applicant_response.responses.build
      

  end

  def create
    
    
  	@applicant_response = ApplicantResponse.new(applicant_response_params)
    
  	respond_to do |format|
  		if @applicant_response.save
        
        # sign_out current_user
        
  			format.html{render :index, notice: 'Your Answers are submitted.'}
        
        
       
        
       
  		else
  			render 'new'
  		end

  	end
  end


  private
  
    
  
  def applicant_response_params
    
  	params.require(:applicant_response).permit!
  end
  
  

end
