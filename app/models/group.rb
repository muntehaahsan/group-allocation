class Group < ActiveRecord::Base
 has_many :students, :through => :group_students
 has_many :group_students, :dependent => :destroy 
 belongs_to :leader, :class_name => 'Student'
 has_many :topics
end
