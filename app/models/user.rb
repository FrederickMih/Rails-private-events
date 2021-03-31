class User < ApplicationRecord
    
    # 4.3.2.9 :source

    has_many :events, dependent: :delete_all, inverse_of: 'creator'

    has_many :attended_events, through: :event_users, source: :events, dependent: :delete_all

    

    validates :username, presence: true    
end
