# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  helper_method :current_student_session, :current_student, :current_teacher_session, :current_teacher

  private
    def current_student_session
      return @current_student_session if defined?(@current_student_session)
      @current_student_session = StudentSession.find
    end

    def current_student
      return @current_student if defined?(@current_student)
      @current_student = current_student_session && current_student_session.student
    end

    def require_student
      unless current_student
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_student_session_url
        return false
      end
    end

    def require_no_student
      if current_student
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to student_url
        return false
      end
    end

    def current_teacher_session
      return @current_teacher_session if defined?(@current_teacher_session)
      @current_teacher_session = TeacherSession.find
    end

    def current_teacher
      return @current_teacher if defined?(@current_teacher)
      @current_teacher = current_teacher_session && current_teacher_session.teacher
    end

    def require_teacher
      unless current_teacher
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_teacher_session_url
        return false
      end
    end

    def require_no_teacher
      if current_teacher
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to teacher_url
        return false
      end
    end

    def store_location
      session[:return_to] = request.request_uri
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
end
