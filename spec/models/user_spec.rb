require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    
    it "Should validate a password is supplied" do
      @u = User.create(first_name: "dude", last_name: "duderino", email: "dude@thedude.com", password: nil, password_confirmation: "pass")
      @u.save
      expect(@u).to be_invalid
    end




  end

end
