class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
    @student = Student.find_by_id(params[:id])
  end

  def activate
    @student = Student.find_by_id(params[:id])
    #reverses boolean
    byebug
    if @student.active
      @student.active = !@student.active
      @student.save
    elsif !@student.active
      @student.active = !@student.active
      @student.save
    end
    redirect_to student_path(@student)
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end