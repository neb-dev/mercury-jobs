class Job < ApplicationRecord
  validates :title, :description, :company, :location, presence: true
end
