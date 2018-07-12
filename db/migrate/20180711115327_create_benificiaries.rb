class CreateBenificiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :benificiaries do |t|
      t.integer :user_id
      t.string :account_no

      t.timestamps
    end
  end
end
