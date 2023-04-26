class SubmissionsController < ApplicationController
  before_action :set_submission, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:show, :index]

  # GET /submissions or /submissions.json
  def index
    @submissions = Submission.all
  end

  # GET /submissions/1 or /submissions/1.json
  def show
    @ratings = @submission.ratings 
    # flash[:assignment_id] = params[:id]
    idforrefsub = params[:id]
    flash[:submis_ref] = idforrefsub

    
  end

  # GET /submissions/new
  def new
    #@assignment = Assignment.find(params[:assignment_id])
    @submission = Submission.new
    #@submission.assignment_id = @assignment.id
    refid= flash[:asig_ref]
    flash[:ref] = refid
  end

  # GET /submissions/1/edit
  def edit
  end

  # POST /submissions or /submissions.json
  def create
    assig_id = flash[:ref]
    @assignment = Assignment.find(assig_id)
   
    @submission = @assignment.submissions.build(name: params[:submission][:name], description: params[:submission][:description])
    @submission.user_id = current_user.id

    if @submission.save
      redirect_to assignments_path
    else 
      redirect_to root_url
    end
    # respond_to do |format|
    #   if @submission.save
    #     format.html { redirect_to submission_url(@submission), notice: "Submission was successfully created." }
    #     format.json { render :show, status: :created, location: @submission }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @submission.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /submissions/1 or /submissions/1.json
  def update
    respond_to do |format|
      if @submission.update(submission_params)
        format.html { redirect_to submission_url(@submission), notice: "Submission was successfully updated." }
        format.json { render :show, status: :ok, location: @submission }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1 or /submissions/1.json
  def destroy
    @submission.destroy

    respond_to do |format|
      format.html { redirect_to submissions_url, notice: "Submission was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @submission = Submission.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def submission_params
      params.require(:submission).permit(:title, :description, :assignment_id, :user_id)
    end
end
