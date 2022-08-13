require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    @user = User.new(name: 'Keza', email: 'keza@icloud.com')
  end
  before { subject.save }

  it 'Should show the Username' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Should show the Email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end
