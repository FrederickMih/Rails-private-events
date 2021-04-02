require 'rails_helper'
require 'spec_helper'

RSpec.describe 'User', type: :controller do
  describe 'User creation' do
    it 'Creates a new user sucesfully' do
      u1 = User.new(username: "John")
      expect(u1.valid?).to eq(true)
    end
    it 'does not allow creating of new User' do
      u2 = User.new()
      expect(u2.valid?).to eq(false)
    end
     it 'Creates an event from a user' do
      u1 = User.new(username: "John")
     e1 = u1.events.build(description: "something", date: Time.now) 
      expect(e1.valid?).to eq(true)
    end

    it 'Checks that a user has not created the event' do
      u2 = User.new(username: "Fred")
      u1 = User.new(username: "John")
      u1.save
      u2.save
      e1 = Event.new(description: "Marriage celebration", user_id: u1.id, date: Date.today)
      expect(u2.events.size).to eq(0)
    end

    it 'Checks that a user has created an event' do
      u2 = User.new(username: "Fred")
      u1 = User.new(username: "John")
      u1.save
      u2.save
      e1 = Event.new(description: "Marriage celebration", user_id: u1.id, date: Date.today)
      e1.save
      expect(u1.events.size).to eq(1)
    end

    it 'Checks that a user has been added to an event' do
      u2 = User.new(username: "Fred")
      u1 = User.new(username: "John")
      u1.save
      u2.save
      e1 = Event.new(description: "Marriage celebration", user_id: u1.id, date: Date.today)
      expect(u2.attended_events.size).to eq(0)
    end

    it 'Checks that a user has not been added to an event' do
      u2 = User.new(username: "Fred")
      u1 = User.new(username: "John")
      u1.save
      u2.save
      e1 = Event.new(description: "Marriage celebration", user_id: u1.id, date: Date.today)
      e1.save
      u1.attended_events << e1
      expect(u1.attended_events.size).to eq(1)
    end
   
  end

  
end

# RSpec.describe 'Event', type: :system do
#   describe 'index page' do
#     it 'shows the right content' do
#       visit hello_world_index_path
#       expect(page).to have_content('Hello, world!')
#     end
#   end
# end