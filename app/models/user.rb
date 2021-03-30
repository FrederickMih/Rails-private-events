class User < ApplicationRecord

    has_many :events
    validates :username, presence: true    
end
