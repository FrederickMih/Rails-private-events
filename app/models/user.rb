class User < ApplicationRecord
    # has_many :events through event_user
    # 4.3.2.9 :source

    has_many :events, dependent: :delete_all, inverse_of: 'creator'


    validates :username, presence: true    
end
