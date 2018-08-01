require 'rails_helper'

RSpec.describe Address, :type => :model do
it { Address.reflect_on_association(:user).macro.should  eq(:belongs_to) }

end