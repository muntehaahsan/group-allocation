class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :email, index: true
      t.text :grade
    end
  end
end
