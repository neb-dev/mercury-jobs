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
  end
end
