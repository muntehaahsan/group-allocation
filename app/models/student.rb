class Student < ActiveRecord::Base
  has_many  :groups, :through => :group_students
  has_many :group_students, :dependent => :destroy  
 
end
