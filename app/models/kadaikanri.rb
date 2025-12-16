class Kadaikanri < ApplicationRecord
  belongs_to :status

  def self.ransackable_attributes(auth_object = nil)
    ["content", "created_at", "entrydate", "id", "location", "no", "plan", "reporter", "status_id", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["status"]
  end
end
