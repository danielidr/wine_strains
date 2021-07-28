class Position < ApplicationRecord
    has_many :magazines_position, dependent: :destroy
    has_many :magazines, through: :magazines_position
    has_many :oenologists, through: :magazines_position
end
