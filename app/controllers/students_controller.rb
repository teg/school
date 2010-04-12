class StudentsController < ApplicationController
  before_filter :require_no_student, :only => [:new, :create]
  before_filter :require_student, :only => [:show, :edit, :update]

  def show
    @student = @current_student
  end

  def new
    @student = Student.new
  end

  def edit
    @student = @current_student
  end

  def create
    @student = Student.new(params[:student])

    if @student.save
      flash[:notice] = 'Student was successfully created.'
      redirect_to(@student)
    else
      render :action => :new
    end
  end

  def update
    @student = @current_student

    if @student.update_attributes(params[:student])
      flash[:notice] = 'Student was successfully updated.'
      redirect_to(@student)
    else
      render :action => :edit
    end
  end

end
