class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @students = all_students
    respond_with(@students)
  end

  def show
    respond_with(@student)
  end

  def new
    @student = Student.new
    respond_with(@student)
  end

  def edit
  end

  def create
    @student = Student.new(student_params)
    @student.save
    respond_with(@student)
  end

  def update
    @student.update(student_params)
    respond_with(@student)
  end

  def destroy
    @student.destroy
    respond_with(@student)
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
