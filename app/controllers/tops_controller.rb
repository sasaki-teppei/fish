class TopsController < ApplicationController
  def index
  end
  
  def company_login_form
  end
  
  def company_login
     @company = Company.find_by(email: params[:email], password: params[:password])
    if @company
      session[:company_id] = @company.id
      redirect_to("/companies/show")
    else
      
    end
  end
  
  def user_login_form
  end
  
  def user_login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to("/users/show")
    end
  end
  
end
