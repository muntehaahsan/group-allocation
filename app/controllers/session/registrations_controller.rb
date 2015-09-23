class Session::RegistrationsController < Devise::RegistrationsController
  def create
             build_resource(sign_up_params)
	    if resource.save
		sign_up(resource_name, resource)
		# Set any signed up user as guest for read-only access
		resource.update_attribute(:role_id, 3)
	        respond_to do |format|
		      format.html {redirect_to root_path } 
		      format.json { render :json=> {:authentication_token=>resource.authentication_token, :email=>resource.email, :user_id=> resource.id, :status => true}}
                 end
	    else
	      clean_up_passwords resource
		respond_to do |format|
			format.html {respond_with resource, :location => after_inactive_sign_up_path_for(resource)}
			format.json { render :json => resource.errors, :status => :unprocessable_entity }
		end
	    end
 end
end
