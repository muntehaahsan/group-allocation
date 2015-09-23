class Session::RegistrationsController < Devise::RegistrationsController
  def create
            super
	    # Set any signed up user as guest for read-only access
	    resource.update_attribute(:role_id, 3)
  end
end
