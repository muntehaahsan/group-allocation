class CreateGroupStudents < ActiveRecord::Migration
  def change
    create_table :group_students do |t|
      t.references :group, index: true
      t.references :student, index: true
    end
  end
end
