require 'rails_helper'

RSpec.describe Transaction, type: :model do
  subject do
    @user = User.new(name: 'Keza', email: 'keza@icloud.com')
    @category = Category.new(name: 'Mackup', icon: 'asssets/budgetimage.png', user: @user)
    @transaction = Transaction.new(name: 'Stylist', amount: 23, category: @category, user: @user)
  end

  before { subject.save }

  it 'Should show the transaction Name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Should associate transaction to a user and a category' do
    expect(subject).to respond_to(:user, :category)
  end

  it 'Should show for each transaction, a given amount' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'Should render the amout in an integer value' do
    expect(subject.amount).to be_kind_of Numeric
  end

  it 'Should render the amount greater or equal 0' do
    subject.amount = -1
    expect(subject).to_not be_valid
  end
end
