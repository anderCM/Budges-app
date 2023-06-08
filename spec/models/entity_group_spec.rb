require 'rails_helper'

RSpec.describe EntityGroup, type: :model do
  before do
    @user = User.create(name: Faker::Name.name,
                        email: Faker::Internet.email,
                        password: Faker::Internet.password)
    @entity = Entity.create(name: Faker::Company.name,
                            amount: 25.50,
                            author: @user)
    @group = Group.create(name: Faker::Company.name,
                          icon: Faker::Avatar.image,
                          user: @user)
  end

  it 'is invalid without entity' do
    entity_group = EntityGroup.new(entity: nil)
    entity_group.valid?
    expect(entity_group.errors[:entity]).to include('must exist')
  end

  it 'is invalid without group' do
    entity_group = EntityGroup.new(entity: @entity, group: nil)
    entity_group.valid?
    expect(entity_group.errors[:group]).to include('must exist')
  end

  it 'should be saved in DB' do
    EntityGroup.create(entity: @entity, group: @group)
    last_inserted = EntityGroup.last
    expect(last_inserted.entity.name).to eq(@entity.name)
    expect(last_inserted.group.user).to eq(@group.user)
  end
end
