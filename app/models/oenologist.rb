class Oenologist < ApplicationRecord
    has_many :wines_score, dependent: :destroy
    has_many :wines, through: :wines_score
end
