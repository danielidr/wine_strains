class Oenologist < ApplicationRecord
    has_many :wines_score, dependent: :destroy
    has_many :wines, through: :wines_score
    
    has_many :magazines_position, dependent: :destroy
    has_many :magazines, through: :magazines_position
    has_many :positions, through: :magazines_position

    accepts_nested_attributes_for :magazines_position, reject_if: :all_blank, allow_destroy: true
end
