class AddNewFieldsToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :house_no, :string
    add_column :addresses, :street_no, :string
    add_column :addresses, :area, :string
    add_column :addresses, :city, :string
    add_column :addresses, :state, :string
    add_column :addresses, :country, :string
    add_column :addresses, :pin, :integer
    add_column :addresses, :address_proof, :text
  end
end
