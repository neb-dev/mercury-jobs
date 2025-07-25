require 'rails_helper'

RSpec.describe "homepage/index.html.erb", type: :view do
  it "displays the page title" do
    render template: "homepage/index", layout: "layouts/application"
    expect(rendered).to include("Mercury Jobs")
  end
end
