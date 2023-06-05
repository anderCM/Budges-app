require 'rails_helper'

RSpec.describe Group, type: :model do
  before do
    @user = User.create(name: Faker::Name.name,
                        email: Faker::Internet.email,
                        password: Faker::Internet.password)
    @name = Faker::Company.name
    @icon = Faker::Avatar.image
  end

  it 'is invalid without name' do
    group = Group.new(name: nil)
    group.valid?
    expect(group.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without icon' do
    group = Group.new(name: @name, icon: nil)
    group.valid?
    expect(group.errors[:icon]).to include("can't be blank")
  end

  it 'is invalid without user' do
    group = Group.new(name: @name, icon: @icon, user: nil)
    group.valid?
    expect(group.errors[:user]).to include('must exist')
  end

  it 'should be saved in DB' do
    Group.create(name: @name, icon: @icon, user: @user)
    last_inserted = Group.last
    expect(last_inserted.name).to eq(@name)
    expect(last_inserted.user).to eq(@user)
  end
end
