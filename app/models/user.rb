class User < ApplicationRecord
    has_many :bets
    has_secure_password
    validates :username, presence: true 
    validates :username, uniqueness: { case_sensitive: false }
end
