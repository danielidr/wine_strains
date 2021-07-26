class Strain < ApplicationRecord
    has_many :wines_strains, dependent: :destroy
    has_many :wines, through: :wines_strains
    validates :name, presence: true, uniqueness: true, length: {maximum: 100}
    
end
