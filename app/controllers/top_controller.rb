class TopController < ApplicationController
  def index
  end
  
  def company_login_form
  end
  
  def company_login
     @company = Company.find_by(email: params[:email], password: params[:password])
    if @company
      session[:company_id] = @company.id
      redirect_to("/companies/#{@company.id}")
    else
      
    end
  end
  
  def company_logout
    session[:company_id] = nil
    redirect_to("/top/index")
  end
  
  def user_login_form
  end
  
  def user_login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to("/users/#{@user.id}")
    end
  end
  
  def user_logout
    session[:user_id] = nil
    redirect_to("/top/index")
  end
  
end
