class League < ApplicationRecord
    belongs_to :sport 
    has_many :matches
end
