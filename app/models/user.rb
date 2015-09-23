class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role

 def self.add_student_as_leader(student)
	user = User.find_or_create_by( email: student.email)
	user.name = student.name
        user.password = DEFAULT_PASSWORD
        user.role_id = 2
 	user.student_id = student.id
        user.save
	user
 end
 
 def role? 
	self.role.name
  end
end
