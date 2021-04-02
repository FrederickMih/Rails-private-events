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
     e1 = events.build(description: "something", date: Time.now) 
      expect(e1.valid?).to eq(true)
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