require 'rails_helper'

RSpec.describe Transaction, :type => :model do
 subject { Transaction.new }

 it { Transaction.reflect_on_association(:user).macro.should  eq(:belongs_to) }
 it { Transaction.reflect_on_association(:account).macro.should  eq(:belongs_to) }

  it "is transaction valid " do
    subject.account_no = 123
    subject.amount = 12
    expect(subject).to be_valid
  end
 
end

