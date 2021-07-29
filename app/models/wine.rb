class Wine < ApplicationRecord
    has_many :wines_strains, dependent: :destroy
    has_many :strains, through: :wines_strains
    has_many :wines_scores, dependent: :destroy
    has_many :oenologists, through: :wines_scores

    validates :name, presence: true, uniqueness: true, length: {maximum: 100}
    accepts_nested_attributes_for :wines_strains, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :wines_scores, reject_if: :all_blank, allow_destroy: true

    def find_proportion(w, s)
        join = WinesStrain.find_by(wine_id: w.id, strain_id: s.id)
        float = join.proportion
        (float == float.floor) ? float.to_i : float
    end
    
    def find_score(w)
        scores = WinesScore.where(wine_id: w.id).pluck(:score)
        scores.join(", ")
    end 
    
    
end
