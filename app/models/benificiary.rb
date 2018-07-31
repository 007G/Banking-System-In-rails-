class Benificiary < ApplicationRecord
  after_create :send_benificiary_message 
  has_and_belongs_to_many :users

  validates :account_no, numericality: { only_integer: true }
  validates :first_name, presence: true
  validates :last_name, presence: true 

  def send_benificiary_message
    UserMailer.benificiary_added(user_id).deliver
  end

end
