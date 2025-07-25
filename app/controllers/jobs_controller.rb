class JobsController < ApplicationController
  def index
    @jobs = Job.all()
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new()
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to(@job, flash: { success: "Job created successfully." })
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to(@job, flash: { success: "Job updated successfully." })
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    @job = Job.find(params[:id])
    if @job.destroy
      redirect_to(jobs_path(), flash: { success: "Job deleted successfully." })
    else
      render(:show, status: :unprocessable_entity)
    end
  end

  private
    def job_params
      params.require(:job).permit(:title, :description, :company, :location)
    end
end
