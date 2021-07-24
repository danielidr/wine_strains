class WinesStrain < ApplicationRecord
  belongs_to :wine
  belongs_to :strain
  validates :proportion, presence: true, numericality: { less_than_or_equal_to: 100 }
end
