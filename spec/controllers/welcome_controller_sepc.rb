require 'rails_helper'
require 'spec_helper'

RSpec.describe WelcomeController, :type => :controller do
let(:user) {FactoryBot.create(:user)}

  describe "GET index" do
      get :index
      expect(assigns(:users))==([user])
    end

    it "renders the index template" do
      sign_in user 
      get :index
      expect(response).to render_template("welcome/index")
    end

  end

  