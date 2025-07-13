require 'rails_helper'
include Rails.application.routes.url_helpers


RSpec.describe "Jobs", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get new_job_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /jobs/:id" do
    it "returns http success" do
      job = Job.create!(title: "Dev", description: "Write code",
                        company: "Acme", location: "Remote")
      get job_path(job)
      expect(response).to have_http_status(:success)
    end
  end
end
