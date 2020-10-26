class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def current_company
    @current_company ||= Company.find_by(id: session[:company_id])
  end

  def logged_in?
    !current_company.nil?
  end
end