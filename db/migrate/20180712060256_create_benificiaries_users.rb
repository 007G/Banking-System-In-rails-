class CreateBenificiariesUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :benificiaries_users do |t|
      t.integer :user_id
      t.integer :benificiary_id
    end
  end
end
