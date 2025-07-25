require 'rails_helper'

RSpec.describe "jobs/index.html.erb", type: :view do
  it "displays no jobs available" do
    render
    expect(rendered).to include("No jobs available")
  end

  it "displays jobs" do
    assign(:jobs, [
      Job.create!(title: "Dev", company: "Acme", location: "Remote",
                  description: "Build stuff"),
      Job.create!(title: "Designer", company: "DesignCo", location: "NYC",
                  description: "Design things")
    ])
    render
    expect(rendered).to match(/Acme/)
    expect(rendered).to match(/DesignCo/)
  end
end
