require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password.length > 6) }
  end

  describe '#is_password?' do
    it 'should check if password matches' do
      pw = BCrypt::Password.create("Johnny")
      expect(pw).to eq(true)
    end
  end

  describe '#reset_session_token' do
    
  end

  describe '::find_by_credentials' do
    
  end
end
