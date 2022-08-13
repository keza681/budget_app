require 'rails_helper'

RSpec.describe Category, type: :model do
  subject do
    @user = User.new(name: 'Keza', email: 'keza@icloud.com')
    @category = Category.new(name: 'Mackup', icon: 'asssets/budgetimage.png', user: @user)
  end

  before { subject.save }

  it 'Should render the Name of Categoy which should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Should associate category to a user' do
    expect(subject).to respond_to(:user)
  end
end
