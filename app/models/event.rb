class Event < ApplicationRecord

    # belongs_to :user
    belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
    validates :description, presence: true

    
    has_many :event_users

    has_many :attendees, through: :event_users, source: :user, dependent: :delete_all

    
    
end
