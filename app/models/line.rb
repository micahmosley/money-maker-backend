class Line < ApplicationRecord
    has_many :bet_lines
    has_many :bets, through: :bet_lines
    
end
