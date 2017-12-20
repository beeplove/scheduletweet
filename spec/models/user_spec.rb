require 'rails_helper'

RSpec.describe User, type: :model do
  describe ".from_omniauth" do
    let(:user) { FactoryBot.create(:user) }
    let(:auth) { double("auth") }

    it "creates user record when provider and uid pair doesn't exist" do
      allow(auth).to receive(:provider) { user.provider }
      allow(auth).to receive(:uid) { user.uid }

      current_user = User.from_omniauth(auth)

      expect(current_user == user).to be_truthy
    end

    it "returns user when exists" do
      allow(auth).to receive(:provider) { user.provider }
      allow(auth).to receive(:uid) { "6789" }
      allow(auth).to receive_message_chain(:info, :name) { "Jim Smith" }
      allow(auth).to receive_message_chain(:credentials, :token) { "A1W3F4s8hx9S19s0k4H8Cv8" }
      allow(auth).to receive_message_chain(:credentials, :secret) { "U82sA1WI93F4L0s8hxS59S1M59s0k4z9H8C0hv8" }

      current_user = User.from_omniauth(auth)

      expect(User.last == current_user).to be_truthy
    end
  end
end
