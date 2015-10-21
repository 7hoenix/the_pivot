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

  describe 'post #update' do
    context 'when given tags' do
      it 'attaches thos tags to the user' do
        user = create(:user)
        session[:user_id] = user.id

        tag1 =TagName.create(name: "first tag", color: "color1")
        tag2 = TagName.create(name: "second tag", color: "color2")
        tag3 = TagName.create(name: "third tag", color: "color2")


        post :update, user: { tag_ids: [tag1.id, tag2.id, tag3.id]}

        expect(user.tags.count).to eq(3)
      end
    end
  end
end
