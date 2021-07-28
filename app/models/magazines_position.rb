class MagazinesPosition < ApplicationRecord
  belongs_to :magazine
  belongs_to :position
  belongs_to :oenologist
end
