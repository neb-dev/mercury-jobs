class HomepageController < ApplicationController
  def index
    @jobs = Job.all()
  end
end
