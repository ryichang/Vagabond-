module SessionsHelper

	 def login(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def current_user
     
    @current_user ||= session[:user_id] && User.find(session[:user_id])



  end

  def logged_in?
    if current_user == nil
      # redirect_to new_session_path
    else
      true
    end
  end

  def logout
    @current_user = session[:user_id] = nil
  end
  
end
