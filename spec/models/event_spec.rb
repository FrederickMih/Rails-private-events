require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Event', type: :controller do
   describe 'Create' do
     it 'Event successfully created' do
      u1 = User.new(username: "Fred")
      u1.save
      e1 = Event.new(description: "Marriage celebration", user_id: u1.id, date: Date.today)
      expect(e1.valid?).to eq(true)
     end
     it 'Event was not successfully created' do
      e2 = Event.new()
      expect(e2.valid?).to eq(false)
     end

   end

end