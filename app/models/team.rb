class Team < ApplicationRecord
    belongs_to :match 
    has_many :lines
end
