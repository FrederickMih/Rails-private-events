class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  validates :description, presence: true
  validates :date, presence: true

  has_many :event_users

  has_many :attendees, through: :event_users, source: :user, dependent: :delete_all

  scope :past, -> { where('date < ?', Date.today) }
  scope :upcoming, -> { where('date >= ?', Date.today) }

  @past_events = Event.past
  @upcoming_events = Event.upcoming
end
