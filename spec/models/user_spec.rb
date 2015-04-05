require 'rails_helper'

describe User, type: :model do
  it 'is valid with an email and password' do
    user = build(:user)

    expect(user).to be_valid
  end

  it 'is invalid without an email' do
    user = build(:user, email: nil)

    expect(user).to_not be_valid
  end

  it 'is invalid without a password' do
    user = build(:user, password: nil, password_confirmation: nil)

    expect(user).to_not be_valid
  end

  it 'is invalide if passwords do not match' do
    user = build(:user, password: nil, password_confirmation: 'gibberish124')

    expect(user).to_not be_valid
  end
end
