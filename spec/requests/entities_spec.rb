require 'rails_helper'

RSpec.describe 'Entities', type: :request do
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

      @entity = Entity.create(name: Faker::Company.name,
                              amount: Faker::Number.decimal(l_digits: 3, r_digits: 2),
                              author: @user)
      EntityGroup.create(entity: @entity, group: @group)

      get group_entities_path(@group)
    end
    it '#index should return successful response' do
      expect(response).to have_http_status(:success)
    end

    it '#index should render the index template' do
      expect(response).to render_template(:index)
    end

    it '#index should include new group' do
      expect(assigns(:entities)).to match_array([@entity])
    end

    it '#create should not accept empty params' do
      entity_params = {
        name: Faker::Company.name,
        amount: nil
      }

      expect { post group_entities_path(@group), params: { entity: entity_params } }.not_to change(Entity, :count)
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
