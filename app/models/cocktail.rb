class Cocktail < ApplicationRecord
  has_many :dose, dependent: :destroy
end
