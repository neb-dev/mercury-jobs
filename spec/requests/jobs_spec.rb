require 'rails_helper'
include Rails.application.routes.url_helpers

RSpec.describe "Jobs", type: :request do
  let(:valid_attributes) do
    {
      title: "Backend Engineer",
      company: "DataSolutions",
      location: "Austin, TX",
      description: "Design APIs and work with PostgreSQL databases."
    }
  end

  let(:invalid_attributes) do
    {
      title: ""
    }
  end

  describe "GET /jobs" do
    it "assigns @jobs" do
      job = Job.create!(valid_attributes)
      get jobs_path()
      expect(assigns(:jobs)).to include(job)
    end
  end
  describe "GET /new" do
    it "returns http success" do
      get new_job_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /jobs/:id" do
    it "returns http success" do
      job = Job.create!(valid_attributes)
      get job_path(job)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /jobs" do
    context "with valid params" do
      it "creates a new job and redirects" do
        expect {
          post jobs_path, params: { job: valid_attributes }
        }.to change(Job, :count).by(1)
        expect(response).to redirect_to(job_path(Job.last))
        follow_redirect!
        expect(response.body).to include("Job created successfully.")
      end
    end

    context "with invalid params" do
      it "renders new with unprocessable entity status" do
        expect(post jobs_path, params: { job: invalid_attributes })
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include("Create Job")
      end
    end
  end

  describe "PATCH /jobs/:id " do
    let!(:job) { Job.create!(valid_attributes) }

    context "with valid params" do
      let(:new_attributes) { { title: "Updated Title" } }

      it "updates the job and redirects" do
        patch job_path(job), params: { job: new_attributes }
        expect(response).to redirect_to(job_path(job))
        follow_redirect!
        expect(response.body).to include("Job updated successfully.")
        job.reload
        expect(job.title).to eq("Updated Title")
      end

      it "renders edit with unprocessable entity status" do
        patch job_path(job), params: { job: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /jobs/:id" do
    let!(:job) { Job.create!(valid_attributes) }

    it "deletes the job and redirects to jobs" do
      expect {
        delete job_path(job)
    }.to change(Job, :count).by(-1)

    expect(response).to redirect_to(jobs_path)
    follow_redirect!
    expect(response.body).to include("Job deleted successfully.")
    end
  end
end
