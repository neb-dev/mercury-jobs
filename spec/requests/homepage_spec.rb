require 'rails_helper'

RSpec.describe "Homepages", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get root_path
      expect(response).to render_template(:index)
    end

    it "assigns @jobs" do
      job = Job.create!(title: "Developer", company: "Acme", location: "Remote",
                        description: "Build stuff")
      get root_path
      expect(assigns(:jobs)).to include(job)
    end
  end
end
