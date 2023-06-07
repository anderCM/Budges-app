require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  describe 'GET' do
    before do
      @user = User.create(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Internet.password
      )

      sign_in @user

      @group = Group.create(name: 'Shopping',
                            icon: Faker::Avatar.image,
                            user: @user)

      get groups_path
    end
    it '#index should return successful response' do
      expect(response).to have_http_status(:success)
    end

    it '#index should render the index template' do
      expect(response).to render_template(:index)
    end

    it '#index should include new group' do
      expect(assigns(:groups)).to match_array([@group])
    end

    it '#create should not accept empty params' do
      group_params = {
        name: 'Health',
        icon: nil
      }
      expect { post groups_path, params: { group: group_params } }.not_to change(Group, :count)
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
