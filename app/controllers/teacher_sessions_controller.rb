class TeacherSessionsController < ApplicationController

  def new
    @teacher_session = TeacherSession.new
  end

  def create
    @teacher_session = TeacherSession.new(params[:teacher_session])
    if @teacher_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default @teacher_session.teacher
    else
      render :action => :new
    end
  end

  def destroy
    current_teacher_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default new_teacher_session_url
  end

end

