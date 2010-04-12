class LessonsController < ApplicationController
  before_filter :require_student, :only => [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
    @lessons = @current_student.lessons
  end

  def show
    @lesson = @current_student.lessons.find(params[:id])
  end

  def new
    @lesson = Lesson.new()
  end

  def edit
    @lesson = @current_student.lessons.find(params[:id])
  end

  def create
    @lesson = Lesson.new(params[:lesson])
      
    if @current_student.lessons<<@lesson
      flash[:notice] = 'Lesson was successfully created.'
      redirect_to(@lesson)
    else
      render :action => "new"
    end
  end

  def update
    @lesson = @current_student.lessons.find(params[:id])

    if @lesson.update_attributes(params[:lesson])
      flash[:notice] = 'Lesson was successfully updated.'
      redirect_to(@lesson)
    else
      render :action => "edit"
    end
  end

  def destroy
    @lesson = @current_student.lessons.find(params[:id])
    @lesson.destroy

    redirect_to(lessons_url)
  end
end
