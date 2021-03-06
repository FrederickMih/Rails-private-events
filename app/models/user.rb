class User < ApplicationRecord
  has_many :events, dependent: :delete_all, inverse_of: 'creator'
  has_many :event_users

  has_many :attended_events, through: :event_users, source: :event, dependent: :delete_all

  validates :username, presence: true
end
