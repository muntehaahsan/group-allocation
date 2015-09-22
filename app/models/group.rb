class Group < ActiveRecord::Base
 has_many :students, :through => :group_students
 has_many :group_students, :dependent => :destroy
 accepts_nested_attributes_for :group_students 
 belongs_to :leader, :class_name => 'Student'
 has_many :topics
 accepts_nested_attributes_for :topics 
end
