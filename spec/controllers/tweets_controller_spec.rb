require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
  describe "GET index" do
    before(:each) do
      @user = FactoryBot.create(:user)
    end

    context "when user is not logged in" do
      before(:each) do
        session[:current_user] = nil
      end

      it "redirect to '/'" do
        get :index, params: { user_id: 1 }
        expect(response).to redirect_to root_path
      end
    end

    context "when user is logged in" do
      before(:each) do
        session[:current_user] = @user.id
        allow(controller).to receive(:authenticate)
        allow(controller).to receive(:current_user).and_return(@user)
      end

      it "renders 'index' template" do
        get :index, params: { user_id: @user.id }
        expect(response).to render_template("index")
      end
    end
  end

  describe "GET new" do
    before(:each) do
      @user = FactoryBot.create(:user)
    end

    context "when user is not logged in" do
      before(:each) do
        session[:current_user] = nil
      end

      it "redirect to '/'" do
        get :new, params: { user_id: @user.id }
        expect(response).to redirect_to root_path
      end
    end

    context "when user is logged in" do
      before(:each) do
        session[:current_user] = @user.id
        allow(controller).to receive(:authenticate)
        allow(controller).to receive(:current_user).and_return(@user)
      end

      it "renders 'new' template" do
        get :new, params: { user_id: @user.id }
        expect(response).to render_template("new")
      end
    end
  end

end
