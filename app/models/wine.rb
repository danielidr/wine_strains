class Wine < ApplicationRecord
    has_many :wines_strains, dependent: :destroy
    has_many :strains, through: :wines_strains

    accepts_nested_attributes_for :strains, :wines_strains
end
