class TeachersController < ApplicationController
  before_filter :require_no_teacher, :only => [:new, :create]
  before_filter :require_teacher, :only => [:show, :edit, :update]

  def show
    @teacher = @current_teacher
  end

  def new
    @teacher = Teacher.new
  end

  def edit
    @teacher = @current_teacher
  end

  def create
    @teacher = Teacher.new(params[:teacher])

    if @teacher.save
      flash[:notice] = 'Teacher was successfully created.'
      redirect_to :controller => :welcome
    else
      render :action => :new
    end
  end

  def update
    @teacher = @current_teacher

    if @teacher.update_attributes(params[:teacher])
      flash[:notice] = 'Teacher was successfully updated.'
      redirect_to :controller => :welcome
    else
      render :action => :edit
    end
  end

end
