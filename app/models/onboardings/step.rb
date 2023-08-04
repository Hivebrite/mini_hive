class Onboardings::Step < ApplicationRecord
  belongs_to :objective
  belongs_to :resource, polymorphic: true

  validates :objective, :resource, presence: true

  def resource_global_id
    self.resource&.to_global_id
  end

  def resource_global_id=(global_id)
    self.resource = GlobalID::Locator.locate global_id
  end
end
