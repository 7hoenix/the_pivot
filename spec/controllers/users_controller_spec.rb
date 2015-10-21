require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'get #show' do
    context 'when not logged in' do
      it 'redirects to root' do

        get :show

        expect(response).to redirect_to(root_path)
      end
    end
  end
end
