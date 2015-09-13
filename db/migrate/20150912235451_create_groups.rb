class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.datetime :date
      t.integer :leader_id, index: true
      t.timestamps
    end
  end
end
