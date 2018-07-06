class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

          has_many :addresses, dependent: :destroy
          has_one :permanent_address, dependent: :destroy
          has_one :local_address, dependent: :destroy

          accepts_nested_attributes_for :local_address
          accepts_nested_attributes_for :permanent_address
end
