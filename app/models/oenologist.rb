class Oenologist < ApplicationRecord
    has_many :wines_score, dependent: :destroy
    has_many :wines, through: :wines_score
    has_and_belongs_to_many :positions
    has_and_belongs_to_many :magazines
end
