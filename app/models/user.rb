class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :timeoutable

          has_many :addresses, dependent: :destroy
          has_one :permanent_address, dependent: :destroy
          has_one :local_address, dependent: :destroy
          has_one :account, dependent: :destroy
          has_many :transactions, dependent: :destroy

          has_and_belongs_to_many :benificiaries

          accepts_nested_attributes_for :local_address
          accepts_nested_attributes_for :permanent_address

          mount_uploader :document, ImageUploader
          mount_uploader :user_photo, ImageUploader


        after_create :assign_default_role, :account_no

        def assign_default_role
        self.add_role(:user) if self.roles.blank?
        end

        def account_no
          Account.create!(account_no: rand(10 ** 10).to_i, user_id: self.id)
        end  



     


end

