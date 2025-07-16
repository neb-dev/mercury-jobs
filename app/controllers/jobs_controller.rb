class JobsController < ApplicationController
  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new()
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to(@job, notice: "Job updated successfully.")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def job_params
      params.require(:job).permit(:title, :description, :company, :location)
    end
end
