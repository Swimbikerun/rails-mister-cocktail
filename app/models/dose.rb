class Dose < ApplicationRecord
belongs_to :ingredient
belongs_to :cocktail
has_one_attached :photo
  
validates :description, presence: true
validates :ingredient, presence: true
validates :cocktail, presence: true
validates :cocktail, uniqueness: { scope: :ingredient }
end
