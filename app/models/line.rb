class Line < ApplicationRecord
    belongs_to :team
    has_many :bets 
    
end
