class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!

  def index
    @students = all_students
    respond_to do |format|
    	format.html { @students}
    	format.json { render json: @students}
   end
  end

  def show
    respond_to do |format|
    	format.html { @student}
    	format.json { render json: @student}
    end
  end

  def new
    @student = Student.new
    respond_to do |format|
    	format.html { @student}
    	format.json { render json: @student}
    end
  end

  def edit
  end

  def create
    @student = Student.new(student_params)
    @student.save
    respond_to do |format|
    	format.html {redirect_to @student}
    	format.json { render json: @student}
    end
  end

  def update
    @student.update(student_params)
    respond_to do |format|
    	format.html {redirect_to @student}
    	format.json { render json: @student}
    end
  end

  def destroy
    @student.destroy
    respond_to do |format|
    	format.html { redirect_to @student}
    	format.json { render json: @student}
    end
  end

  def get_student_list
	@students = all_students
	render partial: '/students/student_list' , layout: false 
  end


  private
    
    def all_students
      Student.all
    end 

    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:name, :email, :grade)
    end
end
