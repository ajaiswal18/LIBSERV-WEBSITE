class HomepageController < ApplicationController

	before_filter :authenticate_admin!, only: [:admin_page]

  before_action :set_test_score, only: [:remove]
  
def index

  
  
  
end

  def jobpostings
    @jobpostings = Jobposting.all

  end





  def job_apply

    #@application = Homepage.new
  	# @jobpostings = Jobposting.all

  	if params[:title]
      @job = Jobposting.where(:Job_Title=> params[:title]).first
      puts "*************************************************"
      puts "*************************************************"
      @application = Homepage.new
    
    end
  end
  def assessments
    @assessments = Assessments.all
  end
  def shortlists
    @shortlists = Shortlist.all
  end
  def admin_page
    @test_score = TestScore.all
    @job_applicants = JobApplicant.all

  end
  def remove
  # @test_score = TestScore.find(params[:id]).first
  @test_score.destroy
  # respond_to do |format|
  flash[:notice] = "Record successfully deleted"
    redirect_to :action => 'admin_page'
  # end
end
  
  


private

def set_test_score
  @test_score = TestScore.find(params[:id])
end



  
end
