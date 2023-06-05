require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @name = Faker::Name.name
    @email = Faker::Internet.email
    @password = Faker::Internet.password
  end

  it 'is invalid without name' do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without email' do
    user = User.new(name: @name, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'is invalid without minimun 8 characters password' do
    user = User.new(name: @name, email: @email, password: 's')
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 8 characters)")
  end

  it 'should be saved in DB' do
    user = User.create(name: @name, email: @email, password: @password)
    last_inserted = User.last
    expect(last_inserted.name).to eq(@name)
  end

end
