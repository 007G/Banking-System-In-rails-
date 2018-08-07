 require 'rails_helper'
 require 'spec_helper'
 require 'devise'

 RSpec.describe BenificiariesController, :type => :controller do

    current_user = FactoryBot.create(:current_user)

   describe "GET #index" do
     it "populates an array of contacts" do
       contact = FactoryBot.create(:beneficiary)
      get :index
      assigns(:benificiaries)==([contact])
     end
   
     it "renders the :index view" do
       get :index      
      response.should render_template :index
    end
  end

end
