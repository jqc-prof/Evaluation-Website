class RatingsController < ApplicationController
  before_action :set_rating, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:show, :index]

  # GET /ratings or /ratings.json
  def index
    @ratings = Rating.all
  end

  # GET /ratings/1 or /ratings/1.json
  def show
  end

  # GET /ratings/new
  def new
    @rating = Rating.new
    refidsub= flash[:submis_ref]
    flash[:refsub] = refidsub
  end

  # GET /ratings/1/edit
  def edit
  end

  # POST /ratings or /ratings.json
  def create

    submis_id = flash[:refsub]
    @submission = Submission.find(submis_id)
   
    @rating = @submission.ratings.build(score: params[:rating][:score], body: params[:rating][:body])
    @rating.user_id = current_user.id
    if @rating.save
      redirect_to submissions_path
    else
      redirect to root_url
    end
  end

  # PATCH/PUT /ratings/1 or /ratings/1.json
  def update
    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to rating_url(@rating), notice: "Rating was successfully updated." }
        format.json { render :show, status: :ok, location: @rating }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ratings/1 or /ratings/1.json
  def destroy
    @rating.destroy

    respond_to do |format|
      format.html { redirect_to ratings_url, notice: "Rating was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rating_params
      params.require(:rating).permit(:score, :body, :submission_id)
    end
end
