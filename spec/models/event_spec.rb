require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Event', type: :controller do
   describe 'Create' do
     it 'An event successfully' do
      u1 = User.new(username: "Fred")
      e1 = Event.new(description: "Marriage celebration", user_id: u1.id, date: Time.now)
      expect(e1.valid?).to eq(true)
     end
     it 'Event was not successfully' do
      e2 = Event.new()
      expect(e2.valid?).to eq(false)
     end

   end

end