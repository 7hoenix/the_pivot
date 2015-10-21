require 'rails_helper'

RSpec.describe BusinessesController, type: :controller do
  describe 'POST #create' do
    context 'parameters are invalid' do
      it 'redirects to new with a flash error' do
        user = create(:user)
        session[:user_id] = user.id
        business = Business.new()

        post :create, business: {name: "", about: "hi"}

        expect(response).to render_template(:new)
      end
    end
  end
end
