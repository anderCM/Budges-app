require 'rails_helper'

RSpec.describe Entity, type: :model do
  before do
    @user = User.create(name: Faker::Name.name,
                        email: Faker::Internet.email,
                        password: Faker::Internet.password)
    @name = Faker::Company.name
    @amount = 25.50
  end

  it 'is invalid without name' do
    entity = Entity.new(name: nil)
    entity.valid?
    expect(entity.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without amount' do
    entity = Entity.new(name: @name, amount: nil)
    entity.valid?
    expect(entity.errors[:amount]).to include("can't be blank")
  end

  it 'should has amount greater than 0' do
    entity = Entity.new(name: @name, amount: 0)
    entity.valid?
    expect(entity.errors[:amount]).to include('must be greater than or equal to 1')
  end

  it 'is invalid without an user' do
    entity = Entity.new(name: @name, amount: @amount, author: nil)
    entity.valid?
    expect(entity.errors[:author]).to include('must exist')
  end

  it 'should be saved in DB' do
    Entity.create(name: @name, amount: @amount, author: @user)
    last_inserted = Entity.last
    expect(last_inserted.name).to eq(@name)
    expect(last_inserted.author).to eq(@user)
  end
end
