require 'rails_helper'
RSpec.feature 'Group', type: :feature do
  before do
    @user = User.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: Faker::Internet.password
    )

    @group = Group.create(name: Faker::Company.name, icon: Faker::Avatar.image, user: @user)
    @group.total = @group.entity_groups.joins(:entity).sum(:amount)

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    visit groups_path
  end

  it 'should be able to see the group\'s  name.' do
    expect(page).to have_content(@group.name)
  end

  it 'should be able to see the group\'s  total amount.' do
    expect(page).to have_content(@group.total)
  end

  it 'Should be able to view icon' do
    expect(page).to have_css("img[src*='#{@group.icon}']")
  end
end
