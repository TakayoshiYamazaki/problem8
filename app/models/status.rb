class Status < ApplicationRecord
  has_many :kadaikanris

  validates :name, presence: true, uniqueness: true
  validates :disp, presence: true, uniqueness: true
end
