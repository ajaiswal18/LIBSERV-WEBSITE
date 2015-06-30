class JobpostingsController < ApplicationController
  before_action :set_jobposting, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin!, only: [:new, :index]
  # GET /jobpostings
  # GET /jobpostings.json
  def index
    @jobpostings = Jobposting.all
  end

  # GET /jobpostings/1
  # GET /jobpostings/1.json
  def show
  end

  # GET /jobpostings/new
  def new
    @jobposting = Jobposting.new
  end

  # GET /jobpostings/1/edit
  def edit
  end

  # POST /jobpostings
  # POST /jobpostings.json
  def create
    @jobposting = Jobposting.new(jobposting_params)

    respond_to do |format|
      if @jobposting.save
        format.html { redirect_to @jobposting, notice: 'Jobposting was successfully created.' }
        format.json { render :show, status: :created, location: @jobposting }
      else
        format.html { render :new }
        format.json { render json: @jobposting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobpostings/1
  # PATCH/PUT /jobpostings/1.json
  def update
    respond_to do |format|
      if @jobposting.update(jobposting_params)
        format.html { redirect_to @jobposting, notice: 'Jobposting was successfully updated.' }
        format.json { render :show, status: :ok, location: @jobposting }
      else
        format.html { render :edit }
        format.json { render json: @jobposting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobpostings/1
  # DELETE /jobpostings/1.json
  def destroy
    @jobposting.destroy
    respond_to do |format|
      format.html { redirect_to jobpostings_url, notice: 'Jobposting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jobposting
      @jobposting = Jobposting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jobposting_params
      params.require(:jobposting).permit(:S_No, :Posted_On, :Job_Title, :CTC, :Job_Description, :Experience_Req)
    end
end
