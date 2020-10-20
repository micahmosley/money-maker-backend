class Bet < ApplicationRecord
    belongs_to :user
    has_many :bet_lines
    has_many :lines, through: :bet_lines
end
