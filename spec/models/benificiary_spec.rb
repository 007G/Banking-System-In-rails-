require 'rails_helper'

RSpec.describe Benificiary, :type => :model do
subject { Benificiary.new }

 it { Benificiary.reflect_on_association(:users).macro.should  eq(:has_and_belongs_to_many) }

  it "is first_name valid " do
    subject.first_name = "Anything"
    subject.last_name =  "Anything"
    subject.account_no =  123

    expect(subject).to be_valid
  end
 
end

