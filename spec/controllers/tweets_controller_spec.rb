require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
  describe "GET index" do
    let (:user) { FactoryBot.create(:user) }

    context "when user is not logged in" do
      before(:each) do
        session[:current_user] = nil
      end

      it "redirects to '/'" do
        get :index, params: { user_id: 1 }
        expect(response).to redirect_to root_path
      end
    end

    context "when user is logged in" do
      before(:each) do
        session[:current_user] = user.id
        allow(controller).to receive(:authenticate)
        allow(controller).to receive(:current_user).and_return(user)
      end

      it "renders 'index' template" do
        get :index, params: { user_id: user.id }
        expect(response).to render_template("index")
      end
    end
  end

  describe "GET new" do
    let (:user) { FactoryBot.create(:user) }

    context "when user is not logged in" do
      before(:each) do
        session[:current_user] = nil
      end

      it "redirects to '/'" do
        get :new, params: { user_id: user.id }
        expect(response).to redirect_to root_path
      end
    end

    context "when user is logged in" do
      before(:each) do
        session[:current_user] = user.id
        allow(controller).to receive(:authenticate)
        allow(controller).to receive(:current_user).and_return(user)
      end

      it "renders 'new' template" do
        get :new, params: { user_id: user.id }
        expect(response).to render_template("new")
      end
    end
  end

  describe "POST /" do
    let (:user) { FactoryBot.create(:user) }

    context "when user is not logged in" do
      before(:each) do
        session[:current_user] = nil
      end

      it "redirects to '/'" do
        get :new, params: { user_id: user.id }
        expect(response).to redirect_to root_path
      end
    end

    context "when user is logged in" do
      before(:each) do
        session[:current_user] = user.id
        allow(controller).to receive(:authenticate)
        allow(controller).to receive(:current_user).and_return(user)
        allow(ScheduleTweetWorker).to receive(:perform_at)
      end

      it "redirects to '/users/:user_id/tweets'" do
        date = 2.days.from_now.strftime("%m/%d/%Y")
        post :create, params: { user_id: user.id, tweet: { tweet: "Hello World!", scheduled_at: "#{date} 04:22 PM -0800" } }

        expect(response).to redirect_to user_tweets_path(user)
      end

      it "fails when tweet scheduled time is empty" do
        post :create, params: { user_id: user.id, tweet: { tweet: "Hello World!", scheduled_at: nil } }

        expect(controller).to render_template("new")
        # expect(flash[:alert]).to be_present
        # expect(flash[:notice]).to be_blank
      end

      it "fails when tweet scheduled time is set to a past date"
      it "fails when tweet scheduled time is not fomatted correctly"
      it "fails when text length is longer than it should be"
      it "fails when test is empty"
    end
  end


end
