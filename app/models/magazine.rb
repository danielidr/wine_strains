class Magazine < ApplicationRecord
    has_many :magazines_position, dependent: :destroy
    has_many :oenologists, through: :magazines_position
    has_many :positions, through: :magazines_position
end
