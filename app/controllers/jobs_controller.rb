class JobsController < ApplicationController
  before_action :set_job, only: [:edit, :update, :destroy]

  # GET /jobs
  # GET /jobs.json
  def index
    @programmers = Job.programmers.limit(5)
    @designers = Job.designers.limit(5)
  end


  # GET /search
  # GET /search.json
  def search
    # @jobs = Job.search(search_params[:q]) || []
    @jobs = []
    render "index"
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @job = Job.where(slug: params[:id]).first || set_job
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)
    respond_to do |format|
      if @job.save
        ConfirmMailer.confirm_email(@job).deliver
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  # def destroy
  #   @job.destroy
  #   respond_to do |format|
  #     format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id]) if params[:id]
      @job = Job.slug(params[:slug]) if params[:slug]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:title, :description, :job_type, :quantity, :salary, :headquartes, :apply, :company_name, :url, :company_email, :slug, :token)
    end

    def search_params
      params.permit(:q)
    end
end
