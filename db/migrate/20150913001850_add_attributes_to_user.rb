class AddAttributesToUser < ActiveRecord::Migration
  def change
	 add_column :users, :name, :string
	 add_reference :users, :role
         add_reference :users, :student
  end
end
