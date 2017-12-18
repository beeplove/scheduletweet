require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
  describe "GET index" do
    before(:each) do
      @tweet = FactoryBot.create(:tweet)
    end

    context "user is not logged in" do
      before(:each) do
        session[:current_user] = nil
      end

      it "redirec to '/'" do
        get :index, params: { user_id: 1 }
        expect(response).to redirect_to root_path
      end
    end

    context "user is logged in" do
      before(:each) do
        session[:current_user] = @tweet.user_id
        allow(request.env['test']).to receive(:authenticate)
        allow(controller).to receive(:current_user).and_return(@tweet.user)
      end

      it "redirec to '/'" do
        get :index, params: { user_id: 1 }
        expect(response).to render_template("index")
      end
    end
  end
end
