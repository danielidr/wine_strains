class Oenologist < ApplicationRecord
    has_many :wines_scores, dependent: :destroy
    has_many :wines, through: :wines_scores
    
    has_many :magazines_positions, dependent: :destroy
    has_many :magazines, through: :magazines_positions

    accepts_nested_attributes_for :magazines_positions, reject_if: :all_blank, allow_destroy: true
end
