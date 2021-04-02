require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Event', type: :controller do
  describe 'Create' do
    it 'Event successfully created' do
      u1 = User.new(username: 'Fred')
      u1.save
      e1 = Event.new(description: 'Marriage celebration', user_id: u1.id, date: Date.today)
      expect(e1.valid?).to eq(true)
    end
    it 'Event was not successfully created' do
      e2 = Event.new
      expect(e2.valid?).to eq(false)
    end

    it 'Checks that an event has a user' do
      u1 = User.new(username: 'John')
      u1.save
      e1 = Event.new(description: 'Marriage celebration', user_id: u1.id, date: Date.today)
      expect(e1.creator.username).to eq('John')
    end

    it 'Checks that an event is attended by at least a user' do
      u1 = User.new(username: 'John')
      u1.save
      e1 = Event.new(description: 'Marriage celebration', user_id: u1.id, date: Date.today)
      e1.save
      e1.attendees << u1
      expect(e1.attendees.first.username).to eq('John')
    end
  end
end
