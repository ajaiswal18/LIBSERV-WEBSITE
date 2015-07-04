class ShortlistsController < ApplicationController
  before_filter :authenticate_admin!, only: [:new, :index]

  def index
    @shortlists = Shortlist.all
    @users = User.all
    @assessments = Assessment.all
  

  end
  

  def new
    
  	@shortlist = Shortlist.new
    @shortlist.build_user
    @assessment = Assessment.all

    if params[:assess_id]
      puts "I GOT ASS ID IN NEW METHOD #{params[:assess_id]}"
      assessment = Assessment.find(params[:assess_id])
      @the_code = assessment.test_code
    end

    respond_to do |format|
      format.html
      format.json {render json: @the_code}
    end
  	
  	
    
  
  end
  def show
    @user = User.all
    
  end

  def create
  	@shortlist = Shortlist.new(shortlist_params)
  	respond_to do |format|
  		if @shortlist.save
  			format.html {redirect_to @shortlist }
  		else
  			render 'new'
  		end
  	end
  end


  private

  def shortlist_params
  	params.require(:shortlist).permit!
  end
end
