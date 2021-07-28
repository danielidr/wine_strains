class Oenologist < ApplicationRecord
    has_many :wines_score, dependent: :destroy
    has_many :wines, through: :wines_score
    has_and_belongs_to_many :positions
    has_and_belongs_to_many :magazines

    accepts_nested_attributes_for :magazines, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :positions, reject_if: :all_blank, allow_destroy: true
end
