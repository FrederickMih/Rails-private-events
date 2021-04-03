class EventUser < ApplicationRecord
  belongs_to :user, index: true
  belongs_to :event, index: true
end
