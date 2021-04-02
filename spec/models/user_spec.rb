require 'rails_helper'
require 'spec_helper'

RSpec.describe 'User', type: :controller do
  describe 'User creation' do
    it 'Creates a new user sucesfully' do
      u1 = User.new(username: "John")
      expect(u1.valid?).to eq(true)
    end
    it 'does not allow creating of new User' do
      u1 = User.new()
      expect(u1.valid?).to eq(false)
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