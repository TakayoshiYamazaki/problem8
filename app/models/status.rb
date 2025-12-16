class Status < ApplicationRecord
  has_many :kadaikanris

  validates :name, presence: true, uniqueness: true
  validates :disp, presence: true, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end
