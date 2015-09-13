class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.string :subject
      t.references :group, index: true
      t.timestamps
    end
  end
end
