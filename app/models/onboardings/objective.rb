class Onboardings::Objective < ApplicationRecord
  has_many :steps, dependent: :destroy

  validates :name, :description, presence: true
end
