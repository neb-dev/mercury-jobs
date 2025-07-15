require 'rails_helper'

RSpec.describe Job, type: :model do
  it "is valid with valid attributes" do
    job = Job.new(title: "Dev", description: "Code things", company: "Acme",
                  location: "Remote")
    expect(job).to be_valid
  end

  it "is invalid without a title" do
    job = Job.new(title: nil)
    expect(job).not_to be_valid
  end
end
