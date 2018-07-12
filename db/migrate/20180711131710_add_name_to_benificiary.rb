class AddNameToBenificiary < ActiveRecord::Migration[5.2]
  def change
    add_column :benificiaries, :first_name, :string
    add_column :benificiaries, :last_name, :string
  end
end
