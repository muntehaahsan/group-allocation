class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!
  
  def index
    @groups = Group.all
    respond_to do |format|
    	format.html { @groups}
    	format.json { render json: @groups }
   end
  end

  def show
   respond_to do |format|
    	format.html { @group}
    	format.json { render json: @group}
   end
  end

  def new
    @group = Group.new
    @group_students = @group.group_students.build
    @students = @group_students.build_student 
    respond_to do |format|
    	format.html { @group}
    	format.json { render json: @group}
    end
  end

  def edit
  end

  def create
    	   @group = Group.create
    	   # Adding topics in group 
	   if params[:group][:topics_attributes]
		    params[:group][:topics_attributes].each do |group_attr|
			Topic.where(id: group_attr[1][:id]).take.update_attribute(:group_id, @group.id)
		   end
           end
           # Adding students in group 
           student_ids = Array.new
	   if params[:group][:group_students_attributes]
		   params[:group][:group_students_attributes].each do |group_attr|
			group_st = GroupStudent.find_or_create_by(group_id: @group.id, student_id: group_attr[1][:student_attributes][:id])
			group_attr[1][:id] = group_st.id
			student_ids << group_attr[1][:student_attributes][:id]
		   end
		   # Updating Group
		   @group.update(group_params)
		  
   	   else
		   # Updating Group with empty group params i.e.group_prop_params
		   @group.update(group_prop_params)
	   end
           #Enable Leader Log in
           if student_ids.include?(@group.leader_id.to_s || group_params[:leader_id].to_s)
		user = User.add_student_as_leader(@group.leader)
		UserMailer.leader_email(user,@group.name).deliver
           
           else
	  	 # Remove student as group leader if he/she is removed from group
	  	 @group.update_attribute(:leader_id,nil) 
           end
	   @group.save
	   respond_to do |format|
	    	format.html {redirect_to @group}
	    	format.json { render json: @group}
	   end
  end

  def update
           # Adding topics in group IF don't exist already
	   if params[:group][:topics_attributes]
		   Topic.where(group_id:  @group.id).update_all(group_id: nil)
		   params[:group][:topics_attributes].each do |group_attr|
			Topic.where(id: group_attr[1][:id]).take.update_attribute(:group_id, @group.id)
		   end
           end
           # Adding students in group IF don't exist already
           group_students_array =Array.new
           student_ids = Array.new
	   if params[:group][:group_students_attributes]
		   params[:group][:group_students_attributes].each do |group_attr|
			group_st = GroupStudent.find_or_create_by(group_id: @group.id, student_id: group_attr[1][:student_attributes][:id])
			group_attr[1][:id] = group_st.id
			group_students_array <<  group_st.id
                        student_ids << group_attr[1][:student_attributes][:id]
		   end
		   # Updating Group
		   @group.update(group_params)
		   # Updating Deleted students
	       	   GroupStudent.where('id NOT IN (?) and group_id = ?',group_students_array, @group.id).delete_all
   	   else
		   # Updating Group with empty group params i.e.group_prop_params
		   @group.update(group_prop_params)
		   # Updating Deleted students
	       	   GroupStudent.where(:group_id => @group.id).delete_all
           end
           #Enable Leader Log in
           if student_ids.include?(@group.leader_id.to_s)
		user = User.add_student_as_leader(@group.leader)
		UserMailer.leader_email(user,@group.name).deliver
           
           else
	  	 # Remove student as group leader if he/she is removed from group
	  	 @group.update_attribute(:leader_id,nil) 
           end
           
   respond_to do |format|
    	format.html {redirect_to @group}
    	format.json { render json: @group}
   end
  end

  def destroy
    @group.destroy
    respond_to do |format|
    	format.html {redirect_to @group}
    	format.json { render json: @group}
   end
  end
  
  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
       params.require(:group).permit(:id,:name, :date,:leader_id, 
					group_students_attributes: [:id,
						 student_attributes: [:id, :name, :email, :grade ]
								],
								topics_attributes:[:id, :name, :subject] )
    end

    def group_prop_params
       params.require(:group).permit!
    end

end
