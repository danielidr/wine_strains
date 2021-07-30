class WinesScore < ApplicationRecord
  belongs_to :wine
  belongs_to :oenologist

  validates :score, presence: true, numericality: { less_than_or_equal_to: 100 }
end
