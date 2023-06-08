require 'rails_helper'
RSpec.feature 'Entity', type: :feature do
  before do
    @user = User.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: Faker::Internet.password
    )

    @group = Group.create(name: Faker::Company.name, icon: Faker::Avatar.image, user: @user)

    @entity = Entity.create(name: Faker::Company.name, amount: Faker::Number.decimal(l_digits: 3, r_digits: 2),
                            author: @user)

    EntityGroup.create(entity: @entity, group: @group)

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    visit group_entities_path(@group)
  end

  it 'should be able to see the entity\'s  name.' do
    expect(page).to have_content(@entity.name)
  end

  it 'should be able to see the entity\'s amount.' do
    expect(page).to have_content(@entity.amount)
  end

  it 'Should be able to view group\'s total amount' do
    @group.total = @group.entity_groups.joins(:entity).sum(:amount)
    expect(page).to have_content(@group.total)
  end
end
