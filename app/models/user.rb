class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  before_save :ensure_authentication_token

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

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  private
  
  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
end
