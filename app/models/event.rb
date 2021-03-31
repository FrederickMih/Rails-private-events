class Event < ApplicationRecord

    # belongs_to :user
    belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
    validates :description, presence: true
end
