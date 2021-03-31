class Event < ApplicationRecord

    # belongs_to :user
    belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
    validates :description, presence: true

    has_many :attendees, through: :event_users, source: :users, dependent: :delete_all

    
    
end
