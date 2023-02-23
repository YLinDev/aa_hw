require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_presence_of(:activation_token) }
    it { should validate_length_of(:password).is_at_least(6) }
    it { should have_many(:notes) }

    subject(:amin) { User.create(
      email: 'amin@aa.io',
      password: 'password'
    )}
    it { should validate_uniqueness_of(:email) }
  end

  describe '#is_password?' do
    it 'should check if password matches' do
      pw = BCrypt::Password.create("Johnny")
      expect(pw).to eq(true)
    end
  end

  # describe '#reset_session_token' do
    
  # end

  # describe '::find_by_credentials' do
    
  # end
end
