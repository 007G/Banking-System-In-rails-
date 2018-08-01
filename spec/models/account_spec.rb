require 'rails_helper'

RSpec.describe Account, :type => :model do
it { Account.reflect_on_association(:user).macro.should  eq(:belongs_to) }
it { Account.reflect_on_association(:transactions).macro.should  eq(:has_many) }


end