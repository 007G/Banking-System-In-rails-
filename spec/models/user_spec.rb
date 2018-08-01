require 'rails_helper'

RSpec.describe User, :type => :model do
 subject { User.new }

 it { User.reflect_on_association(:addresses).macro.should eq(:has_many) }
 it { User.reflect_on_association(:permanent_address).macro.should  eq(:has_one) }
 it { User.reflect_on_association(:local_address).macro.should  eq(:has_one) }
 it { User.reflect_on_association(:account).macro.should  eq(:has_one) }
 it { User.reflect_on_association(:transactions).macro.should  eq(:has_many) }
 it { User.reflect_on_association(:benificiaries).macro.should  eq(:has_and_belongs_to_many) }

  it "is User valid " do
  subject.first_name = "anything"
  subject.last_name = "anything"
  subject.bank_name = "anything"
  subject.mobile_no = 123
  subject.user_photo = "anything"
  subject.aadhar_no = 123
  subject.document = "anything"
  subject.email =    "damedo@zep-hyr.com"
  subject.password = "anything"

  expect(subject).to be_valid
  end
 
end

