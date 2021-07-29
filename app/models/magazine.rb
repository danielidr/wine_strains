class Magazine < ApplicationRecord
    has_many :magazines_positions, dependent: :destroy
    has_many :oenologists, through: :magazines_positions
end
