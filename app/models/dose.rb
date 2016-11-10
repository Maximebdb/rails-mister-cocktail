class Dose < ApplicationRecord
  validates :cocktail_id, uniqueness: { scope: :ingredient_id, message: "You already put this ingredient" }

  belongs_to :cocktail
  belongs_to :ingredient
end
